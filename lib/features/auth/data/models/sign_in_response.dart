import 'package:freezed_annotation/freezed_annotation.dart';

// OnboardingStep은 통합 enum 사용
export '../../domain/entities/onboarding_step.dart';

part 'sign_in_response.freezed.dart';
part 'sign_in_response.g.dart';

/// 로그인 응답 DTO
///
/// 백엔드 로그인 성공 시 반환되는 정보입니다.
///
/// **토큰 정보**:
/// - [accessToken]: API 인증용 JWT Access Token (약 1시간 유효)
/// - [refreshToken]: Access Token 갱신용 Refresh Token (약 7일 유효)
///
/// **온보딩 정보**:
/// - [isFirstLogin]: 첫 로그인 여부
/// - [requiresOnboarding]: 온보딩 완료 필요 여부
/// - [onboardingStep]: 현재 온보딩 단계 (TERMS, BIRTH_DATE, GENDER, NICKNAME)
@freezed
class SignInResponse with _$SignInResponse {
  const factory SignInResponse({
    /// API 인증용 JWT Access Token
    required String accessToken,

    /// Access Token 갱신용 Refresh Token
    required String refreshToken,

    /// 첫 로그인 여부
    @Default(false) bool isFirstLogin,

    /// 온보딩 완료 필요 여부
    @Default(false) bool requiresOnboarding,

    /// 현재 온보딩 단계: TERMS, BIRTH_DATE, GENDER, NICKNAME, COMPLETED
    String? onboardingStep,
  }) = _SignInResponse;

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);
}
