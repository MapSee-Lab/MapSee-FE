import '../../../auth/data/models/sign_in_response.dart';

/// 인증 Repository 인터페이스
///
/// 인증 관련 비즈니스 로직의 계약을 정의합니다.
/// Clean Architecture의 Domain Layer에 위치합니다.
abstract class AuthRepository {
  /// 소셜 로그인
  ///
  /// Firebase 인증 후 백엔드에 로그인을 요청합니다.
  ///
  /// [firebaseIdToken]: Firebase에서 발급받은 ID Token
  /// [fcmToken]: FCM 푸시 알림 토큰 (선택)
  /// [deviceType]: 디바이스 타입 - IOS, ANDROID (선택)
  /// [deviceId]: 디바이스 고유 식별자 (선택)
  ///
  /// Returns: 로그인 응답 (토큰 + 온보딩 상태)
  Future<SignInResponse> signIn({
    required String firebaseIdToken,
    String? fcmToken,
    String? deviceType,
    String? deviceId,
  });

  /// 토큰 재발급
  ///
  /// Refresh Token을 사용하여 새로운 토큰 쌍을 발급받습니다.
  Future<void> refreshTokens();

  /// 로그아웃
  ///
  /// 서버에 로그아웃을 알리고 로컬 토큰을 삭제합니다.
  Future<void> logout();

  /// 회원 탈퇴
  ///
  /// 회원 정보를 삭제하고 로컬 토큰을 정리합니다.
  Future<void> withdraw();

  /// 저장된 토큰 존재 여부 확인
  ///
  /// 앱 시작 시 자동 로그인 여부 판단에 사용합니다.
  Future<bool> hasValidTokens();

  /// 온보딩 필요 여부 확인
  Future<bool> requiresOnboarding();

  /// 현재 온보딩 단계 조회
  Future<OnboardingStep?> getCurrentOnboardingStep();
}
