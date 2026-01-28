import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/api_endpoints.dart';
import 'auth_interceptor.dart';
import 'error_interceptor.dart';
import 'token_refresh_interceptor.dart';

part 'api_client.g.dart';

/// Dio 인스턴스 Provider
///
/// 앱 전체에서 사용하는 HTTP 클라이언트입니다.
/// 인증, 토큰 갱신, 에러 변환 인터셉터가 자동으로 적용됩니다.
///
/// **사용법**:
/// ```dart
/// final dio = ref.watch(dioProvider);
/// final response = await dio.get('/api/some-endpoint');
/// ```
@riverpod
Dio dio(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  // 인터셉터 추가 (순서 중요!)
  // 1. 로깅 (개발 모드에서만)
  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        logPrint: (obj) => debugPrint('📡 $obj'),
      ),
    );
  }

  // 2. 인증 (Access Token 주입)
  dio.interceptors.add(AuthInterceptor(ref));

  // 3. 토큰 갱신 (401 → Refresh → 재시도)
  // refreshDio를 별도로 사용하여 인터셉터 순환 방지
  final refreshDio = ref.read(refreshDioProvider);
  dio.interceptors.add(TokenRefreshInterceptor(ref, dio, refreshDio));

  // 4. 에러 변환 (DioException → AppException)
  dio.interceptors.add(ErrorInterceptor());

  return dio;
}

/// 토큰 갱신 전용 Dio 인스턴스
///
/// TokenRefreshInterceptor에서 사용하는 별도의 Dio 인스턴스입니다.
/// 인터셉터 순환을 방지하기 위해 최소한의 설정만 적용합니다.
@riverpod
Dio refreshDio(Ref ref) {
  return Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
}
