// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignInRequestImpl _$$SignInRequestImplFromJson(Map<String, dynamic> json) =>
    _$SignInRequestImpl(
      firebaseIdToken: json['firebaseIdToken'] as String,
      fcmToken: json['fcmToken'] as String?,
      deviceType: json['deviceType'] as String?,
      deviceId: json['deviceId'] as String?,
    );

Map<String, dynamic> _$$SignInRequestImplToJson(_$SignInRequestImpl instance) =>
    <String, dynamic>{
      'firebaseIdToken': instance.firebaseIdToken,
      'fcmToken': instance.fcmToken,
      'deviceType': instance.deviceType,
      'deviceId': instance.deviceId,
    };
