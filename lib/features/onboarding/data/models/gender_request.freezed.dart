// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gender_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GenderRequest _$GenderRequestFromJson(Map<String, dynamic> json) {
  return _GenderRequest.fromJson(json);
}

/// @nodoc
mixin _$GenderRequest {
  /// 성별 (MALE, FEMALE, OTHER)
  Gender get gender => throw _privateConstructorUsedError;

  /// Serializes this GenderRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenderRequestCopyWith<GenderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenderRequestCopyWith<$Res> {
  factory $GenderRequestCopyWith(
    GenderRequest value,
    $Res Function(GenderRequest) then,
  ) = _$GenderRequestCopyWithImpl<$Res, GenderRequest>;
  @useResult
  $Res call({Gender gender});
}

/// @nodoc
class _$GenderRequestCopyWithImpl<$Res, $Val extends GenderRequest>
    implements $GenderRequestCopyWith<$Res> {
  _$GenderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? gender = null}) {
    return _then(
      _value.copyWith(
            gender: null == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as Gender,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GenderRequestImplCopyWith<$Res>
    implements $GenderRequestCopyWith<$Res> {
  factory _$$GenderRequestImplCopyWith(
    _$GenderRequestImpl value,
    $Res Function(_$GenderRequestImpl) then,
  ) = __$$GenderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Gender gender});
}

/// @nodoc
class __$$GenderRequestImplCopyWithImpl<$Res>
    extends _$GenderRequestCopyWithImpl<$Res, _$GenderRequestImpl>
    implements _$$GenderRequestImplCopyWith<$Res> {
  __$$GenderRequestImplCopyWithImpl(
    _$GenderRequestImpl _value,
    $Res Function(_$GenderRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? gender = null}) {
    return _then(
      _$GenderRequestImpl(
        gender: null == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as Gender,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GenderRequestImpl implements _GenderRequest {
  const _$GenderRequestImpl({required this.gender});

  factory _$GenderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenderRequestImplFromJson(json);

  /// 성별 (MALE, FEMALE, OTHER)
  @override
  final Gender gender;

  @override
  String toString() {
    return 'GenderRequest(gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenderRequestImpl &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gender);

  /// Create a copy of GenderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenderRequestImplCopyWith<_$GenderRequestImpl> get copyWith =>
      __$$GenderRequestImplCopyWithImpl<_$GenderRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenderRequestImplToJson(this);
  }
}

abstract class _GenderRequest implements GenderRequest {
  const factory _GenderRequest({required final Gender gender}) =
      _$GenderRequestImpl;

  factory _GenderRequest.fromJson(Map<String, dynamic> json) =
      _$GenderRequestImpl.fromJson;

  /// 성별 (MALE, FEMALE, OTHER)
  @override
  Gender get gender;

  /// Create a copy of GenderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenderRequestImplCopyWith<_$GenderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
