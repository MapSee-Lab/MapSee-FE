/// 온보딩 단계 열거형 (통합)
///
/// 인증 모듈과 온보딩 모듈에서 공통으로 사용합니다.
///
/// **단계**:
/// - [terms]: 약관 동의
/// - [birthDate]: 생년월일 입력
/// - [gender]: 성별 선택
/// - [nickname]: 닉네임 설정
/// - [completed]: 온보딩 완료
enum OnboardingStep {
  terms,
  birthDate,
  gender,
  nickname,
  completed;

  /// 서버 응답 문자열을 OnboardingStep으로 변환
  ///
  /// null 입력 시 기본값 [terms] 반환
  static OnboardingStep fromString(String? value) {
    if (value == null) return OnboardingStep.terms;

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
        return OnboardingStep.terms;
    }
  }

  /// 서버 응답 문자열을 OnboardingStep으로 변환 (nullable)
  static OnboardingStep? fromStringNullable(String? value) {
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

  /// 다음 단계 반환
  OnboardingStep? get next {
    switch (this) {
      case OnboardingStep.terms:
        return OnboardingStep.birthDate;
      case OnboardingStep.birthDate:
        return OnboardingStep.gender;
      case OnboardingStep.gender:
        return OnboardingStep.nickname;
      case OnboardingStep.nickname:
        return OnboardingStep.completed;
      case OnboardingStep.completed:
        return null;
    }
  }

  /// 단계 인덱스 (0-4)
  int get stepIndex {
    switch (this) {
      case OnboardingStep.terms:
        return 0;
      case OnboardingStep.birthDate:
        return 1;
      case OnboardingStep.gender:
        return 2;
      case OnboardingStep.nickname:
        return 3;
      case OnboardingStep.completed:
        return 4;
    }
  }

  /// 서버 전송용 문자열로 변환
  String toServerString() {
    switch (this) {
      case OnboardingStep.terms:
        return 'TERMS';
      case OnboardingStep.birthDate:
        return 'BIRTH_DATE';
      case OnboardingStep.gender:
        return 'GENDER';
      case OnboardingStep.nickname:
        return 'NICKNAME';
      case OnboardingStep.completed:
        return 'COMPLETED';
    }
  }
}
