// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TermsRequest _$TermsRequestFromJson(Map<String, dynamic> json) {
  return _TermsRequest.fromJson(json);
}

/// @nodoc
mixin _$TermsRequest {
  /// 서비스 이용약관 동의 여부
  bool get serviceAgreement => throw _privateConstructorUsedError;

  /// 개인정보 처리방침 동의 여부
  bool get privacyAgreement => throw _privateConstructorUsedError;

  /// 마케팅 정보 수신 동의 여부 (선택)
  bool get marketingAgreement => throw _privateConstructorUsedError;

  /// Serializes this TermsRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TermsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TermsRequestCopyWith<TermsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsRequestCopyWith<$Res> {
  factory $TermsRequestCopyWith(
    TermsRequest value,
    $Res Function(TermsRequest) then,
  ) = _$TermsRequestCopyWithImpl<$Res, TermsRequest>;
  @useResult
  $Res call({
    bool serviceAgreement,
    bool privacyAgreement,
    bool marketingAgreement,
  });
}

/// @nodoc
class _$TermsRequestCopyWithImpl<$Res, $Val extends TermsRequest>
    implements $TermsRequestCopyWith<$Res> {
  _$TermsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TermsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceAgreement = null,
    Object? privacyAgreement = null,
    Object? marketingAgreement = null,
  }) {
    return _then(
      _value.copyWith(
            serviceAgreement: null == serviceAgreement
                ? _value.serviceAgreement
                : serviceAgreement // ignore: cast_nullable_to_non_nullable
                      as bool,
            privacyAgreement: null == privacyAgreement
                ? _value.privacyAgreement
                : privacyAgreement // ignore: cast_nullable_to_non_nullable
                      as bool,
            marketingAgreement: null == marketingAgreement
                ? _value.marketingAgreement
                : marketingAgreement // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TermsRequestImplCopyWith<$Res>
    implements $TermsRequestCopyWith<$Res> {
  factory _$$TermsRequestImplCopyWith(
    _$TermsRequestImpl value,
    $Res Function(_$TermsRequestImpl) then,
  ) = __$$TermsRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool serviceAgreement,
    bool privacyAgreement,
    bool marketingAgreement,
  });
}

/// @nodoc
class __$$TermsRequestImplCopyWithImpl<$Res>
    extends _$TermsRequestCopyWithImpl<$Res, _$TermsRequestImpl>
    implements _$$TermsRequestImplCopyWith<$Res> {
  __$$TermsRequestImplCopyWithImpl(
    _$TermsRequestImpl _value,
    $Res Function(_$TermsRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TermsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceAgreement = null,
    Object? privacyAgreement = null,
    Object? marketingAgreement = null,
  }) {
    return _then(
      _$TermsRequestImpl(
        serviceAgreement: null == serviceAgreement
            ? _value.serviceAgreement
            : serviceAgreement // ignore: cast_nullable_to_non_nullable
                  as bool,
        privacyAgreement: null == privacyAgreement
            ? _value.privacyAgreement
            : privacyAgreement // ignore: cast_nullable_to_non_nullable
                  as bool,
        marketingAgreement: null == marketingAgreement
            ? _value.marketingAgreement
            : marketingAgreement // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TermsRequestImpl implements _TermsRequest {
  const _$TermsRequestImpl({
    required this.serviceAgreement,
    required this.privacyAgreement,
    this.marketingAgreement = false,
  });

  factory _$TermsRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TermsRequestImplFromJson(json);

  /// 서비스 이용약관 동의 여부
  @override
  final bool serviceAgreement;

  /// 개인정보 처리방침 동의 여부
  @override
  final bool privacyAgreement;

  /// 마케팅 정보 수신 동의 여부 (선택)
  @override
  @JsonKey()
  final bool marketingAgreement;

  @override
  String toString() {
    return 'TermsRequest(serviceAgreement: $serviceAgreement, privacyAgreement: $privacyAgreement, marketingAgreement: $marketingAgreement)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TermsRequestImpl &&
            (identical(other.serviceAgreement, serviceAgreement) ||
                other.serviceAgreement == serviceAgreement) &&
            (identical(other.privacyAgreement, privacyAgreement) ||
                other.privacyAgreement == privacyAgreement) &&
            (identical(other.marketingAgreement, marketingAgreement) ||
                other.marketingAgreement == marketingAgreement));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    serviceAgreement,
    privacyAgreement,
    marketingAgreement,
  );

  /// Create a copy of TermsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TermsRequestImplCopyWith<_$TermsRequestImpl> get copyWith =>
      __$$TermsRequestImplCopyWithImpl<_$TermsRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TermsRequestImplToJson(this);
  }
}

abstract class _TermsRequest implements TermsRequest {
  const factory _TermsRequest({
    required final bool serviceAgreement,
    required final bool privacyAgreement,
    final bool marketingAgreement,
  }) = _$TermsRequestImpl;

  factory _TermsRequest.fromJson(Map<String, dynamic> json) =
      _$TermsRequestImpl.fromJson;

  /// 서비스 이용약관 동의 여부
  @override
  bool get serviceAgreement;

  /// 개인정보 처리방침 동의 여부
  @override
  bool get privacyAgreement;

  /// 마케팅 정보 수신 동의 여부 (선택)
  @override
  bool get marketingAgreement;

  /// Create a copy of TermsRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TermsRequestImplCopyWith<_$TermsRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
