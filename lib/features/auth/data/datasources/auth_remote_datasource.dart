import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_client.dart';
import '../models/sign_in_request.dart';
import '../models/sign_in_response.dart';
import '../models/reissue_request.dart';
import '../models/reissue_response.dart';

part 'auth_remote_datasource.g.dart';

/// 인증 Remote DataSource Provider
@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return AuthRemoteDataSource(dio);
}

/// 인증 관련 백엔드 API 호출
///
/// Firebase 인증 후 백엔드 서버와 통신하여
/// JWT 토큰을 발급받고 관리합니다.
class AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  /// 소셜 로그인 (Firebase ID Token → 백엔드 JWT)
  ///
  /// [request]에 Firebase ID Token과 기기 정보를 담아 전송합니다.
  /// 성공 시 Access Token, Refresh Token, 온보딩 상태를 반환합니다.
  ///
  /// Throws: DioException (network errors), AppException (converted errors)
  Future<SignInResponse> signIn(SignInRequest request) async {
    debugPrint('🔐 Calling sign-in API...');
    debugPrint('   Firebase ID Token length: ${request.firebaseIdToken.length}');

    final response = await _dio.post(
      ApiEndpoints.signIn,
      data: request.toJson(),
    );

    debugPrint('✅ Sign-in API response: ${response.statusCode}');

    return SignInResponse.fromJson(response.data);
  }

  /// 토큰 재발급
  ///
  /// Refresh Token을 사용하여 새로운 Access Token을 발급받습니다.
  /// 주로 TokenRefreshInterceptor에서 자동으로 호출됩니다.
  Future<ReissueResponse> reissue(ReissueRequest request) async {
    debugPrint('🔄 Calling reissue API...');

    final response = await _dio.post(
      ApiEndpoints.reissue,
      data: request.toJson(),
    );

    debugPrint('✅ Reissue API response: ${response.statusCode}');

    return ReissueResponse.fromJson(response.data);
  }

  /// 로그아웃
  ///
  /// 서버에 로그아웃을 알리고 토큰을 무효화합니다.
  Future<void> logout() async {
    debugPrint('🚪 Calling logout API...');

    await _dio.post(ApiEndpoints.logout);

    debugPrint('✅ Logout API completed');
  }

  /// 회원 탈퇴
  ///
  /// 회원 정보를 삭제합니다. (Soft Delete)
  Future<void> withdraw() async {
    debugPrint('⚠️ Calling withdraw API...');

    await _dio.delete(ApiEndpoints.withdraw);

    debugPrint('✅ Withdraw API completed');
  }
}
