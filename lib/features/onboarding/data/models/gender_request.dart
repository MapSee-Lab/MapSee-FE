import 'package:freezed_annotation/freezed_annotation.dart';

part 'gender_request.freezed.dart';
part 'gender_request.g.dart';

/// 성별 유형
enum Gender {
  @JsonValue('MALE')
  male,
  @JsonValue('FEMALE')
  female,
  @JsonValue('OTHER')
  other,
}

/// 성별 요청 모델
///
/// POST /api/members/onboarding/gender 요청 바디
@freezed
class GenderRequest with _$GenderRequest {
  const factory GenderRequest({
    /// 성별 (MALE, FEMALE, OTHER)
    required Gender gender,
  }) = _GenderRequest;

  factory GenderRequest.fromJson(Map<String, dynamic> json) =>
      _$GenderRequestFromJson(json);
}
