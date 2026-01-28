import 'package:freezed_annotation/freezed_annotation.dart';

part 'reissue_request.freezed.dart';
part 'reissue_request.g.dart';

/// 토큰 재발급 요청 DTO
@freezed
class ReissueRequest with _$ReissueRequest {
  const factory ReissueRequest({
    /// Refresh Token
    required String refreshToken,
  }) = _ReissueRequest;

  factory ReissueRequest.fromJson(Map<String, dynamic> json) =>
      _$ReissueRequestFromJson(json);
}
