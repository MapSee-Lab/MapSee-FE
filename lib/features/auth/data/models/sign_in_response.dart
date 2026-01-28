import 'package:freezed_annotation/freezed_annotation.dart';

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

/// 온보딩 단계 enum
enum OnboardingStep {
  terms,
  birthDate,
  gender,
  nickname,
  completed;

  /// 서버 응답 문자열을 OnboardingStep으로 변환
  static OnboardingStep? fromString(String? value) {
    if (value == null) return null;

    switch (value.toUpperCase()) {
      case 'TERMS':
        return OnboardingStep.terms;
      case 'BIRTH_DATE':
        return OnboardingStep.birthDate;
      case 'GENDER':
        return OnboardingStep.gender;
      case 'NICKNAME':
        return OnboardingStep.nickname;
      case 'COMPLETED':
        return OnboardingStep.completed;
      default:
        return null;
    }
  }

  /// 라우트 경로로 변환
  String toRoutePath() {
    switch (this) {
      case OnboardingStep.terms:
        return '/onboarding/terms';
      case OnboardingStep.birthDate:
        return '/onboarding/birth-date';
      case OnboardingStep.gender:
        return '/onboarding/gender';
      case OnboardingStep.nickname:
        return '/onboarding/nickname';
      case OnboardingStep.completed:
        return '/home';
    }
  }
}
