// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfileRequest _$ProfileRequestFromJson(Map<String, dynamic> json) {
  return _ProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$ProfileRequest {
  /// 닉네임
  String get name => throw _privateConstructorUsedError;

  /// Serializes this ProfileRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileRequestCopyWith<ProfileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileRequestCopyWith<$Res> {
  factory $ProfileRequestCopyWith(
    ProfileRequest value,
    $Res Function(ProfileRequest) then,
  ) = _$ProfileRequestCopyWithImpl<$Res, ProfileRequest>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$ProfileRequestCopyWithImpl<$Res, $Val extends ProfileRequest>
    implements $ProfileRequestCopyWith<$Res> {
  _$ProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null}) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfileRequestImplCopyWith<$Res>
    implements $ProfileRequestCopyWith<$Res> {
  factory _$$ProfileRequestImplCopyWith(
    _$ProfileRequestImpl value,
    $Res Function(_$ProfileRequestImpl) then,
  ) = __$$ProfileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$ProfileRequestImplCopyWithImpl<$Res>
    extends _$ProfileRequestCopyWithImpl<$Res, _$ProfileRequestImpl>
    implements _$$ProfileRequestImplCopyWith<$Res> {
  __$$ProfileRequestImplCopyWithImpl(
    _$ProfileRequestImpl _value,
    $Res Function(_$ProfileRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null}) {
    return _then(
      _$ProfileRequestImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileRequestImpl implements _ProfileRequest {
  const _$ProfileRequestImpl({required this.name});

  factory _$ProfileRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileRequestImplFromJson(json);

  /// 닉네임
  @override
  final String name;

  @override
  String toString() {
    return 'ProfileRequest(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileRequestImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of ProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileRequestImplCopyWith<_$ProfileRequestImpl> get copyWith =>
      __$$ProfileRequestImplCopyWithImpl<_$ProfileRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileRequestImplToJson(this);
  }
}

abstract class _ProfileRequest implements ProfileRequest {
  const factory _ProfileRequest({required final String name}) =
      _$ProfileRequestImpl;

  factory _ProfileRequest.fromJson(Map<String, dynamic> json) =
      _$ProfileRequestImpl.fromJson;

  /// 닉네임
  @override
  String get name;

  /// Create a copy of ProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileRequestImplCopyWith<_$ProfileRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckNameResponse _$CheckNameResponseFromJson(Map<String, dynamic> json) {
  return _CheckNameResponse.fromJson(json);
}

/// @nodoc
mixin _$CheckNameResponse {
  /// 사용 가능 여부
  bool get available => throw _privateConstructorUsedError;

  /// 메시지 (사용 불가 시 이유)
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this CheckNameResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckNameResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckNameResponseCopyWith<CheckNameResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckNameResponseCopyWith<$Res> {
  factory $CheckNameResponseCopyWith(
    CheckNameResponse value,
    $Res Function(CheckNameResponse) then,
  ) = _$CheckNameResponseCopyWithImpl<$Res, CheckNameResponse>;
  @useResult
  $Res call({bool available, String? message});
}

/// @nodoc
class _$CheckNameResponseCopyWithImpl<$Res, $Val extends CheckNameResponse>
    implements $CheckNameResponseCopyWith<$Res> {
  _$CheckNameResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckNameResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? available = null, Object? message = freezed}) {
    return _then(
      _value.copyWith(
            available: null == available
                ? _value.available
                : available // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckNameResponseImplCopyWith<$Res>
    implements $CheckNameResponseCopyWith<$Res> {
  factory _$$CheckNameResponseImplCopyWith(
    _$CheckNameResponseImpl value,
    $Res Function(_$CheckNameResponseImpl) then,
  ) = __$$CheckNameResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool available, String? message});
}

/// @nodoc
class __$$CheckNameResponseImplCopyWithImpl<$Res>
    extends _$CheckNameResponseCopyWithImpl<$Res, _$CheckNameResponseImpl>
    implements _$$CheckNameResponseImplCopyWith<$Res> {
  __$$CheckNameResponseImplCopyWithImpl(
    _$CheckNameResponseImpl _value,
    $Res Function(_$CheckNameResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckNameResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? available = null, Object? message = freezed}) {
    return _then(
      _$CheckNameResponseImpl(
        available: null == available
            ? _value.available
            : available // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckNameResponseImpl implements _CheckNameResponse {
  const _$CheckNameResponseImpl({required this.available, this.message});

  factory _$CheckNameResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckNameResponseImplFromJson(json);

  /// 사용 가능 여부
  @override
  final bool available;

  /// 메시지 (사용 불가 시 이유)
  @override
  final String? message;

  @override
  String toString() {
    return 'CheckNameResponse(available: $available, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckNameResponseImpl &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, available, message);

  /// Create a copy of CheckNameResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckNameResponseImplCopyWith<_$CheckNameResponseImpl> get copyWith =>
      __$$CheckNameResponseImplCopyWithImpl<_$CheckNameResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckNameResponseImplToJson(this);
  }
}

abstract class _CheckNameResponse implements CheckNameResponse {
  const factory _CheckNameResponse({
    required final bool available,
    final String? message,
  }) = _$CheckNameResponseImpl;

  factory _CheckNameResponse.fromJson(Map<String, dynamic> json) =
      _$CheckNameResponseImpl.fromJson;

  /// 사용 가능 여부
  @override
  bool get available;

  /// 메시지 (사용 불가 시 이유)
  @override
  String? get message;

  /// Create a copy of CheckNameResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckNameResponseImplCopyWith<_$CheckNameResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
