/// 앱 전체의 라우트 경로 상수를 정의하는 클래스
///
/// 모든 라우트 경로는 이 클래스를 통해 접근하여
/// 오타로 인한 버그를 방지하고 유지보수성을 향상시킵니다.
///
/// 사용법:
/// ```dart
/// // 1. 기본 네비게이션 (경로로 이동)
/// context.go(RoutePaths.home)
/// context.push(RoutePaths.login)
///
/// // 2. Named 네비게이션 (이름으로 이동)
/// context.goNamed(RoutePaths.homeName)
/// context.pushNamed(RoutePaths.loginName)
///
/// // 3. 뒤로가기
/// context.pop()
///
/// // 4. go vs push 차이
/// // go: 히스토리 스택 전체를 새 경로로 교체 (뒤로가기 불가능)
/// //     예: 스플래시 → 로그인 → go(홈) → 뒤로가기 불가
/// //     사용: 로그인 성공 후, 온보딩 완료 후 등 (이전 화면으로 못 돌아가게)
/// // push: 히스토리 스택에 새 페이지 추가 (뒤로가기로 이전 페이지로)
/// //      예: 홈 → push(설정) → 뒤로가기 → 홈으로 복귀
/// //      사용: 임시 화면, 상세 화면, 설정 화면 등 (뒤로가기 필요)
/// ```
class RoutePaths {
  // Private constructor to prevent instantiation
  RoutePaths._();

  // ============================================================================
  // Root & Authentication Routes
  // ============================================================================

  /// 초기 스플래시 화면 (인증 상태 체크 및 자동 리다이렉트)
  static const String splash = '/';

  /// 로그인 화면 (Google/Apple Sign-In)
  static const String login = '/login';

  /// 온보딩 화면 (첫 로그인 시: 이용약관 동의, 닉네임 설정 등)
  static const String onboarding = '/onboarding';

  /// 온보딩 - 약관 동의
  static const String onboardingTerms = '/onboarding/terms';

  /// 온보딩 - 생년월일
  static const String onboardingBirthDate = '/onboarding/birth-date';

  /// 온보딩 - 성별
  static const String onboardingGender = '/onboarding/gender';

  /// 온보딩 - 닉네임
  static const String onboardingNickname = '/onboarding/nickname';

  /// 홈 화면 (인증 필수, 메인 기능 진입점)
  static const String home = '/home';

  // ============================================================================
  // Route Names (for named navigation)
  // ============================================================================

  /// 라우트 이름 상수 (go_router의 name 파라미터용)
  static const String splashName = 'splash';
  static const String loginName = 'login';
  static const String onboardingName = 'onboarding';
  static const String onboardingTermsName = 'onboarding-terms';
  static const String onboardingBirthDateName = 'onboarding-birth-date';
  static const String onboardingGenderName = 'onboarding-gender';
  static const String onboardingNicknameName = 'onboarding-nickname';
  static const String homeName = 'home';
}
