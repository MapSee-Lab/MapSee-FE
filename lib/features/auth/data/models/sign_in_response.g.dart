// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignInResponseImpl _$$SignInResponseImplFromJson(Map<String, dynamic> json) =>
    _$SignInResponseImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      isFirstLogin: json['isFirstLogin'] as bool? ?? false,
      requiresOnboarding: json['requiresOnboarding'] as bool? ?? false,
      onboardingStep: json['onboardingStep'] as String?,
    );

Map<String, dynamic> _$$SignInResponseImplToJson(
  _$SignInResponseImpl instance,
) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
  'isFirstLogin': instance.isFirstLogin,
  'requiresOnboarding': instance.requiresOnboarding,
  'onboardingStep': instance.onboardingStep,
};
