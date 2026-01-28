import 'package:freezed_annotation/freezed_annotation.dart';

part 'birth_date_request.freezed.dart';
part 'birth_date_request.g.dart';

/// 생년월일 요청 모델
///
/// POST /api/members/onboarding/birth-date 요청 바디
@freezed
class BirthDateRequest with _$BirthDateRequest {
  const factory BirthDateRequest({
    /// 생년월일 (YYYY-MM-DD 형식)
    required String birthDate,
  }) = _BirthDateRequest;

  factory BirthDateRequest.fromJson(Map<String, dynamic> json) =>
      _$BirthDateRequestFromJson(json);
}
