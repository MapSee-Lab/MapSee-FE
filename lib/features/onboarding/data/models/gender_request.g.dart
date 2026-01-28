// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gender_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenderRequestImpl _$$GenderRequestImplFromJson(Map<String, dynamic> json) =>
    _$GenderRequestImpl(gender: $enumDecode(_$GenderEnumMap, json['gender']));

Map<String, dynamic> _$$GenderRequestImplToJson(_$GenderRequestImpl instance) =>
    <String, dynamic>{'gender': _$GenderEnumMap[instance.gender]!};

const _$GenderEnumMap = {
  Gender.male: 'MALE',
  Gender.female: 'FEMALE',
  Gender.other: 'OTHER',
};
