import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../errors/app_exception.dart';

/// 에러 인터셉터
///
/// Dio 에러를 앱의 커스텀 예외(AppException)로 변환합니다.
///
/// **변환 규칙**:
/// - 네트워크 연결 에러 → NetworkException
/// - 401 Unauthorized → AuthException
/// - 400 Bad Request → ValidationException
/// - 500+ 서버 에러 → ServerException
/// - 그 외 → NetworkException
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final exception = _convertToAppException(err);

    debugPrint('❌ API Error: ${exception.toString()}');
    debugPrint('   Path: ${err.requestOptions.path}');
    debugPrint('   Status: ${err.response?.statusCode}');

    // DioException을 유지하되, error 필드에 AppException을 담아서 전달
    handler.next(DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: exception,
      message: exception.message,
    ));
  }

  /// DioException을 AppException으로 변환
  AppException _convertToAppException(DioException err) {
    // 네트워크 연결 에러
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout ||
        err.error is SocketException) {
      return NetworkException(
        message: '인터넷 연결을 확인해주세요.',
        code: 'NETWORK_ERROR',
        originalException: err,
      );
    }

    // 요청 타임아웃
    if (err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      return NetworkException(
        message: '서버 응답이 너무 느립니다. 잠시 후 다시 시도해주세요.',
        code: 'TIMEOUT',
        originalException: err,
      );
    }

    // HTTP 상태 코드 기반 에러
    final statusCode = err.response?.statusCode;
    final responseData = err.response?.data;

    // 서버에서 전달한 에러 메시지 추출
    String? serverMessage;
    String? serverCode;
    if (responseData is Map<String, dynamic>) {
      serverMessage = responseData['message'] as String? ??
          responseData['error'] as String?;
      serverCode = responseData['code'] as String?;
    }

    switch (statusCode) {
      case 400:
        return ValidationException(
          message: serverMessage ?? '잘못된 요청입니다.',
          code: serverCode ?? 'BAD_REQUEST',
          originalException: err,
        );

      case 401:
        return AuthException(
          message: serverMessage ?? '인증이 만료되었습니다. 다시 로그인해주세요.',
          code: serverCode ?? 'UNAUTHORIZED',
          originalException: err,
        );

      case 403:
        return AuthException(
          message: serverMessage ?? '접근 권한이 없습니다.',
          code: serverCode ?? 'FORBIDDEN',
          originalException: err,
        );

      case 404:
        return ServerException(
          message: serverMessage ?? '요청한 리소스를 찾을 수 없습니다.',
          code: serverCode ?? 'NOT_FOUND',
          originalException: err,
        );

      case 409:
        return ValidationException(
          message: serverMessage ?? '중복된 데이터가 있습니다.',
          code: serverCode ?? 'CONFLICT',
          originalException: err,
        );

      case 422:
        return ValidationException(
          message: serverMessage ?? '입력 데이터를 처리할 수 없습니다.',
          code: serverCode ?? 'UNPROCESSABLE_ENTITY',
          originalException: err,
        );

      case 429:
        return NetworkException(
          message: '요청이 너무 많습니다. 잠시 후 다시 시도해주세요.',
          code: 'TOO_MANY_REQUESTS',
          originalException: err,
        );

      case 500:
      case 502:
      case 503:
      case 504:
        return ServerException(
          message: serverMessage ?? '서버 오류가 발생했습니다. 잠시 후 다시 시도해주세요.',
          code: serverCode ?? 'SERVER_ERROR',
          originalException: err,
        );

      default:
        return NetworkException(
          message: serverMessage ?? '알 수 없는 오류가 발생했습니다.',
          code: serverCode ?? 'UNKNOWN_ERROR',
          originalException: err,
        );
    }
  }
}
