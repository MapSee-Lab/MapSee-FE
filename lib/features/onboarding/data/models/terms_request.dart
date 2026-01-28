import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_request.freezed.dart';
part 'terms_request.g.dart';

/// 약관 동의 요청 모델
///
/// POST /api/members/onboarding/terms 요청 바디
@freezed
class TermsRequest with _$TermsRequest {
  const factory TermsRequest({
    /// 서비스 이용약관 동의 여부
    required bool serviceAgreement,

    /// 개인정보 처리방침 동의 여부
    required bool privacyAgreement,

    /// 마케팅 정보 수신 동의 여부 (선택)
    @Default(false) bool marketingAgreement,
  }) = _TermsRequest;

  factory TermsRequest.fromJson(Map<String, dynamic> json) =>
      _$TermsRequestFromJson(json);
}
