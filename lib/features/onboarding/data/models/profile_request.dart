import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_request.freezed.dart';
part 'profile_request.g.dart';

/// 프로필(닉네임) 요청 모델
///
/// POST /api/members/profile 요청 바디
@freezed
class ProfileRequest with _$ProfileRequest {
  const factory ProfileRequest({
    /// 닉네임
    required String name,
  }) = _ProfileRequest;

  factory ProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileRequestFromJson(json);
}

/// 닉네임 중복 확인 응답 모델
///
/// GET /api/members/check-name?name=xxx
@freezed
class CheckNameResponse with _$CheckNameResponse {
  const factory CheckNameResponse({
    /// 사용 가능 여부
    required bool available,

    /// 메시지 (사용 불가 시 이유)
    String? message,
  }) = _CheckNameResponse;

  factory CheckNameResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckNameResponseFromJson(json);
}
