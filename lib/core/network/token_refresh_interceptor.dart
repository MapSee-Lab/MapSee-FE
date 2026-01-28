import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/api_endpoints.dart';
import 'token_storage.dart';

/// 토큰 갱신 인터셉터
///
/// 401 Unauthorized 응답 시 Refresh Token으로 Access Token을 갱신하고
/// 원래 요청을 재시도합니다.
///
/// **동작**:
/// 1. 401 에러 감지
/// 2. Refresh Token으로 새 Access Token 요청 (refreshDio 사용)
/// 3. 새 토큰 저장
/// 4. 원래 요청 재시도
/// 5. Refresh Token도 만료된 경우 → 로그아웃 처리
///
/// **주의**: 토큰 갱신 요청 시 [_refreshDio]를 사용하여
/// 인터셉터 순환 호출을 방지합니다.
class TokenRefreshInterceptor extends Interceptor {
  final Ref _ref;
  final Dio _mainDio;
  final Dio _refreshDio;

  /// 토큰 갱신 중 여부 (중복 갱신 방지)
  bool _isRefreshing = false;

  /// 갱신 완료 대기 중인 요청들
  final List<({RequestOptions options, ErrorInterceptorHandler handler})>
      _pendingRequests = [];

  TokenRefreshInterceptor(this._ref, this._mainDio, this._refreshDio);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // 401 에러가 아니면 그대로 전달
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    // 토큰 갱신 요청 자체가 실패한 경우 → 로그아웃
    if (err.requestOptions.path.contains(ApiEndpoints.reissue)) {
      debugPrint('🔴 Refresh token expired, logging out...');
      await _handleLogout();
      return handler.next(err);
    }

    debugPrint('🔄 401 detected, attempting token refresh...');

    // 이미 갱신 중이면 대기열에 추가
    if (_isRefreshing) {
      debugPrint('⏳ Token refresh in progress, queuing request...');
      _pendingRequests.add((options: err.requestOptions, handler: handler));
      return;
    }

    _isRefreshing = true;

    try {
      // 토큰 갱신 시도
      final success = await _refreshToken();

      if (success) {
        debugPrint('✅ Token refreshed successfully');

        // 원래 요청 재시도
        final response = await _retryRequest(err.requestOptions);
        handler.resolve(response);

        // 대기 중인 요청들도 재시도
        _retryPendingRequests();
      } else {
        debugPrint('🔴 Token refresh failed, logging out...');
        await _handleLogout();
        handler.next(err);
        _rejectPendingRequests(err);
      }
    } catch (e) {
      debugPrint('❌ Token refresh error: $e');
      await _handleLogout();
      handler.next(err);
      _rejectPendingRequests(err);
    } finally {
      _isRefreshing = false;
    }
  }

  /// Refresh Token으로 새 Access Token 요청
  Future<bool> _refreshToken() async {
    try {
      final tokenStorage = _ref.read(tokenStorageProvider);
      final refreshToken = await tokenStorage.getRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        debugPrint('⚠️ No refresh token available');
        return false;
      }

      // 토큰 갱신 요청 (인터셉터 순환 방지를 위해 별도 Dio 인스턴스 사용)
      final response = await _refreshDio.post(
        ApiEndpoints.reissue,
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200 && response.data != null) {
        final newAccessToken = response.data['accessToken'] as String?;
        final newRefreshToken = response.data['refreshToken'] as String?;

        if (newAccessToken != null && newRefreshToken != null) {
          await tokenStorage.saveTokens(
            accessToken: newAccessToken,
            refreshToken: newRefreshToken,
          );
          return true;
        }
      }

      return false;
    } catch (e) {
      debugPrint('❌ Refresh token request failed: $e');
      return false;
    }
  }

  /// 원래 요청 재시도
  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final tokenStorage = _ref.read(tokenStorageProvider);
    final newAccessToken = await tokenStorage.getAccessToken();

    // 새 토큰으로 헤더 업데이트
    requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

    return await _mainDio.fetch(requestOptions);
  }

  /// 대기 중인 요청들 재시도
  void _retryPendingRequests() {
    for (final pending in _pendingRequests) {
      _retryRequest(pending.options).then(
        (response) => pending.handler.resolve(response),
        onError: (error) => pending.handler.reject(error as DioException),
      );
    }
    _pendingRequests.clear();
  }

  /// 대기 중인 요청들 거부
  void _rejectPendingRequests(DioException err) {
    for (final pending in _pendingRequests) {
      pending.handler.next(err);
    }
    _pendingRequests.clear();
  }

  /// 로그아웃 처리
  Future<void> _handleLogout() async {
    try {
      final tokenStorage = _ref.read(tokenStorageProvider);
      await tokenStorage.clearTokens();
      debugPrint('🚪 Tokens cleared, user logged out');

      // TODO: 로그인 화면으로 리다이렉트 (GoRouter 사용)
      // ref.read(routerProvider).go('/login');
    } catch (e) {
      debugPrint('❌ Logout cleanup error: $e');
    }
  }
}
