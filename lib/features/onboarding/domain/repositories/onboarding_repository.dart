import '../../data/models/gender_request.dart';
import '../../data/models/profile_request.dart';

/// 온보딩 Repository 인터페이스
abstract class OnboardingRepository {
  /// 약관 동의 제출
  ///
  /// [serviceAgreement]: 서비스 이용약관 동의
  /// [privacyAgreement]: 개인정보 처리방침 동의
  /// [marketingAgreement]: 마케팅 정보 수신 동의 (선택)
  Future<void> submitTerms({
    required bool serviceAgreement,
    required bool privacyAgreement,
    bool marketingAgreement = false,
  });

  /// 생년월일 제출
  ///
  /// [birthDate]: 생년월일 (DateTime)
  Future<void> submitBirthDate(DateTime birthDate);

  /// 성별 제출
  ///
  /// [gender]: 성별 (Gender enum)
  Future<void> submitGender(Gender gender);

  /// 프로필(닉네임) 제출
  ///
  /// [name]: 닉네임
  Future<void> submitProfile(String name);

  /// 닉네임 중복 확인
  ///
  /// Returns: 사용 가능 여부와 메시지
  Future<CheckNameResponse> checkName(String name);

  /// 온보딩 완료 처리
  ///
  /// 로컬 저장소의 온보딩 상태를 완료로 변경
  Future<void> completeOnboarding();
}
