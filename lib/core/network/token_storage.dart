import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_storage.g.dart';

/// 토큰 저장소 Provider
@riverpod
TokenStorage tokenStorage(Ref ref) {
  return TokenStorage();
}

/// 토큰 보안 저장소
///
/// flutter_secure_storage를 사용하여 Access Token과 Refresh Token을
/// 안전하게 저장하고 관리합니다.
///
/// **저장 키**:
/// - `access_token`: 백엔드 API 인증용 JWT Access Token
/// - `refresh_token`: Access Token 갱신용 Refresh Token
/// - `requires_onboarding`: 온보딩 필요 여부 (true/false)
/// - `onboarding_step`: 현재 온보딩 단계 (TERMS, BIRTH_DATE, GENDER, NICKNAME)
class TokenStorage {
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _requiresOnboardingKey = 'requires_onboarding';
  static const _onboardingStepKey = 'onboarding_step';

  final FlutterSecureStorage _storage;

  TokenStorage({FlutterSecureStorage? storage})
      : _storage = storage ??
            const FlutterSecureStorage(
              aOptions: AndroidOptions(encryptedSharedPreferences: true),
              iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
            );

  // ============================================
  // Access Token
  // ============================================

  /// Access Token 저장
  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  /// Access Token 조회
  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  /// Access Token 삭제
  Future<void> deleteAccessToken() async {
    await _storage.delete(key: _accessTokenKey);
  }

  // ============================================
  // Refresh Token
  // ============================================

  /// Refresh Token 저장
  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  /// Refresh Token 조회
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  /// Refresh Token 삭제
  Future<void> deleteRefreshToken() async {
    await _storage.delete(key: _refreshTokenKey);
  }

  // ============================================
  // Token Pair (Access + Refresh)
  // ============================================

  /// Access Token과 Refresh Token을 함께 저장
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      saveAccessToken(accessToken),
      saveRefreshToken(refreshToken),
    ]);
  }

  /// 모든 토큰 삭제 (로그아웃 시)
  Future<void> clearTokens() async {
    await Future.wait([
      deleteAccessToken(),
      deleteRefreshToken(),
      deleteOnboardingState(),
    ]);
  }

  /// 토큰 존재 여부 확인
  Future<bool> hasTokens() async {
    final accessToken = await getAccessToken();
    return accessToken != null && accessToken.isNotEmpty;
  }

  // ============================================
  // Onboarding State
  // ============================================

  /// 온보딩 상태 저장
  Future<void> saveOnboardingState({
    required bool requiresOnboarding,
    String? onboardingStep,
  }) async {
    await _storage.write(
      key: _requiresOnboardingKey,
      value: requiresOnboarding.toString(),
    );
    if (onboardingStep != null) {
      await _storage.write(key: _onboardingStepKey, value: onboardingStep);
    }
  }

  /// 온보딩 필요 여부 조회
  Future<bool> getRequiresOnboarding() async {
    final value = await _storage.read(key: _requiresOnboardingKey);
    return value?.toLowerCase() == 'true';
  }

  /// 현재 온보딩 단계 조회
  Future<String?> getOnboardingStep() async {
    return await _storage.read(key: _onboardingStepKey);
  }

  /// 온보딩 완료 처리
  Future<void> completeOnboarding() async {
    await _storage.write(key: _requiresOnboardingKey, value: 'false');
    await _storage.delete(key: _onboardingStepKey);
  }

  /// 온보딩 상태 삭제
  Future<void> deleteOnboardingState() async {
    await Future.wait([
      _storage.delete(key: _requiresOnboardingKey),
      _storage.delete(key: _onboardingStepKey),
    ]);
  }
}
