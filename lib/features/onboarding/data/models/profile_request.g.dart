// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileRequestImpl _$$ProfileRequestImplFromJson(Map<String, dynamic> json) =>
    _$ProfileRequestImpl(name: json['name'] as String);

Map<String, dynamic> _$$ProfileRequestImplToJson(
  _$ProfileRequestImpl instance,
) => <String, dynamic>{'name': instance.name};

_$CheckNameResponseImpl _$$CheckNameResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CheckNameResponseImpl(
  available: json['available'] as bool,
  message: json['message'] as String?,
);

Map<String, dynamic> _$$CheckNameResponseImplToJson(
  _$CheckNameResponseImpl instance,
) => <String, dynamic>{
  'available': instance.available,
  'message': instance.message,
};
