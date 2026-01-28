import 'package:freezed_annotation/freezed_annotation.dart';

part 'reissue_response.freezed.dart';
part 'reissue_response.g.dart';

/// 토큰 재발급 응답 DTO
@freezed
class ReissueResponse with _$ReissueResponse {
  const factory ReissueResponse({
    /// 새로운 Access Token
    required String accessToken,

    /// 새로운 Refresh Token
    required String refreshToken,
  }) = _ReissueResponse;

  factory ReissueResponse.fromJson(Map<String, dynamic> json) =>
      _$ReissueResponseFromJson(json);
}
