import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'token_storage.dart';

/// 인증 인터셉터
///
/// 모든 HTTP 요청에 Access Token을 자동으로 주입합니다.
///
/// **동작**:
/// 1. 요청 전: Authorization 헤더에 Bearer Token 추가
/// 2. 인증이 필요 없는 경로는 제외 (예: /auth/sign-in)
class AuthInterceptor extends Interceptor {
  final Ref _ref;

  /// 인증이 필요 없는 경로 목록
  static const _publicPaths = [
    '/api/auth/sign-in',
    '/api/auth/reissue',
  ];

  AuthInterceptor(this._ref);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // 인증이 필요 없는 경로는 토큰 주입 생략
    if (_isPublicPath(options.path)) {
      debugPrint('🔓 Public path, skipping auth: ${options.path}');
      return handler.next(options);
    }

    try {
      final tokenStorage = _ref.read(tokenStorageProvider);
      final accessToken = await tokenStorage.getAccessToken();

      if (accessToken != null && accessToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $accessToken';
        debugPrint('🔐 Token injected for: ${options.path}');
      } else {
        debugPrint('⚠️ No access token available for: ${options.path}');
      }
    } catch (e) {
      debugPrint('❌ Error reading token: $e');
    }

    return handler.next(options);
  }

  /// 인증이 필요 없는 경로인지 확인
  bool _isPublicPath(String path) {
    return _publicPaths.any((publicPath) => path.contains(publicPath));
  }
}
