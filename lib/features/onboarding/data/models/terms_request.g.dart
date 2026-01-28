// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TermsRequestImpl _$$TermsRequestImplFromJson(Map<String, dynamic> json) =>
    _$TermsRequestImpl(
      serviceAgreement: json['serviceAgreement'] as bool,
      privacyAgreement: json['privacyAgreement'] as bool,
      marketingAgreement: json['marketingAgreement'] as bool? ?? false,
    );

Map<String, dynamic> _$$TermsRequestImplToJson(_$TermsRequestImpl instance) =>
    <String, dynamic>{
      'serviceAgreement': instance.serviceAgreement,
      'privacyAgreement': instance.privacyAgreement,
      'marketingAgreement': instance.marketingAgreement,
    };
