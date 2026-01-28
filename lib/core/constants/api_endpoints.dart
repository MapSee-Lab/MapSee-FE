import 'package:flutter_dotenv/flutter_dotenv.dart';

/// API 엔드포인트 중앙 관리
/// Centralized API Endpoint Management
///
/// 환경 변수(.env)를 통해 Base URL 설정 관리
/// Base URL configuration managed via environment variables (.env)
///
/// **사용 가능한 환경 변수**:
/// - `API_BASE_URL`: 백엔드 API Base URL (기본값: https://api.mapsy.suhsaechan.kr)
/// - `WS_URL`: WebSocket 연결 URL
/// - `USE_MOCK_API`: Mock API 사용 여부 (true/false)
class ApiEndpoints {
  // Private 생성자 - 인스턴스화 방지
  ApiEndpoints._();

  // ============================================
  // Base URL (환경 변수에서 로드)
  // ============================================

  /// API Base URL (.env에서 로드, 기본값: 개발 서버)
  static String get baseUrl =>
      dotenv.env['API_BASE_URL'] ?? 'https://api.mapsy.suhsaechan.kr';

  /// WebSocket URL (.env에서 로드)
  static String get wsUrl =>
      dotenv.env['WS_URL'] ?? 'wss://api.mapsy.suhsaechan.kr/ws';

  /// Mock API 사용 여부 (.env에서 로드)
  static bool get useMockApi =>
      dotenv.env['USE_MOCK_API']?.toLowerCase() == 'true';

  // ============================================
  // Auth API Endpoints
  // ============================================

  /// 소셜 로그인 (Firebase ID Token → 백엔드 JWT)
  static const String signIn = '/api/auth/sign-in';

  /// 토큰 재발급 (Refresh Token → 새 Access Token)
  static const String reissue = '/api/auth/reissue';

  /// 로그아웃
  static const String logout = '/api/auth/logout';

  /// 회원 탈퇴
  static const String withdraw = '/api/auth/withdraw';

  // ============================================
  // Member API Endpoints
  // ============================================

  /// 회원 기본 경로
  static const String members = '/api/members';

  /// 온보딩: 약관 동의
  static const String onboardingTerms = '/api/members/onboarding/terms';

  /// 온보딩: 생년월일
  static const String onboardingBirthDate = '/api/members/onboarding/birth-date';

  /// 온보딩: 성별
  static const String onboardingGender = '/api/members/onboarding/gender';

  /// 프로필 업데이트 (닉네임 등)
  static const String memberProfile = '/api/members/profile';

  /// 닉네임 중복 확인
  static const String checkName = '/api/members/check-name';

  // ============================================
  // Place API Endpoints
  // ============================================

  /// 장소 기본 경로
  static const String place = '/api/place';

  /// 장소 상세 조회
  static String placeDetail(String placeId) => '/api/place/$placeId';

  /// 임시 저장 장소 목록
  static const String temporaryPlaces = '/api/place/temporary';

  /// 저장된 장소 목록
  static const String savedPlaces = '/api/place/saved';

  /// 장소 저장
  static String savePlace(String placeId) => '/api/place/$placeId/save';

  // ============================================
  // Content API Endpoints (AI 추출)
  // ============================================

  /// AI 분석 요청 (SNS URL → 장소 추출)
  static const String contentAnalyze = '/api/content/analyze';

  /// 콘텐츠 기본 경로
  static const String content = '/api/content';

  /// 콘텐츠 상세 조회 (폴링용)
  static String contentDetail(String contentId) => '/api/content/$contentId';

  /// 회원 콘텐츠 목록
  static const String memberContent = '/api/content/member';

  /// 최근 콘텐츠
  static const String recentContent = '/api/content/recent';

  /// 저장된 장소 (콘텐츠에서)
  static const String contentSavedPlaces = '/api/content/place/saved';
}
