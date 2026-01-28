import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_request.freezed.dart';
part 'sign_in_request.g.dart';

/// 로그인 요청 DTO
///
/// Firebase 인증 후 백엔드에 전달할 로그인 정보입니다.
///
/// **필수 필드**:
/// - [firebaseIdToken]: Firebase에서 발급받은 ID Token
///
/// **선택 필드**:
/// - [fcmToken]: FCM 푸시 알림 토큰
/// - [deviceType]: 디바이스 타입 (IOS, ANDROID)
/// - [deviceId]: 디바이스 고유 식별자
@freezed
class SignInRequest with _$SignInRequest {
  const factory SignInRequest({
    /// Firebase ID Token (필수)
    required String firebaseIdToken,

    /// FCM 푸시 알림 토큰 (선택)
    String? fcmToken,

    /// 디바이스 타입: IOS, ANDROID (선택)
    String? deviceType,

    /// 디바이스 고유 식별자 UUID (선택)
    String? deviceId,
  }) = _SignInRequest;

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);
}
