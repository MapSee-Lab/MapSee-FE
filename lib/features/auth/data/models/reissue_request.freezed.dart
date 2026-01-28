// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reissue_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReissueRequest _$ReissueRequestFromJson(Map<String, dynamic> json) {
  return _ReissueRequest.fromJson(json);
}

/// @nodoc
mixin _$ReissueRequest {
  /// Refresh Token
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this ReissueRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReissueRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReissueRequestCopyWith<ReissueRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReissueRequestCopyWith<$Res> {
  factory $ReissueRequestCopyWith(
    ReissueRequest value,
    $Res Function(ReissueRequest) then,
  ) = _$ReissueRequestCopyWithImpl<$Res, ReissueRequest>;
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class _$ReissueRequestCopyWithImpl<$Res, $Val extends ReissueRequest>
    implements $ReissueRequestCopyWith<$Res> {
  _$ReissueRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReissueRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? refreshToken = null}) {
    return _then(
      _value.copyWith(
            refreshToken: null == refreshToken
                ? _value.refreshToken
                : refreshToken // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReissueRequestImplCopyWith<$Res>
    implements $ReissueRequestCopyWith<$Res> {
  factory _$$ReissueRequestImplCopyWith(
    _$ReissueRequestImpl value,
    $Res Function(_$ReissueRequestImpl) then,
  ) = __$$ReissueRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class __$$ReissueRequestImplCopyWithImpl<$Res>
    extends _$ReissueRequestCopyWithImpl<$Res, _$ReissueRequestImpl>
    implements _$$ReissueRequestImplCopyWith<$Res> {
  __$$ReissueRequestImplCopyWithImpl(
    _$ReissueRequestImpl _value,
    $Res Function(_$ReissueRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReissueRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? refreshToken = null}) {
    return _then(
      _$ReissueRequestImpl(
        refreshToken: null == refreshToken
            ? _value.refreshToken
            : refreshToken // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReissueRequestImpl implements _ReissueRequest {
  const _$ReissueRequestImpl({required this.refreshToken});

  factory _$ReissueRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReissueRequestImplFromJson(json);

  /// Refresh Token
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'ReissueRequest(refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReissueRequestImpl &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, refreshToken);

  /// Create a copy of ReissueRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReissueRequestImplCopyWith<_$ReissueRequestImpl> get copyWith =>
      __$$ReissueRequestImplCopyWithImpl<_$ReissueRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReissueRequestImplToJson(this);
  }
}

abstract class _ReissueRequest implements ReissueRequest {
  const factory _ReissueRequest({required final String refreshToken}) =
      _$ReissueRequestImpl;

  factory _ReissueRequest.fromJson(Map<String, dynamic> json) =
      _$ReissueRequestImpl.fromJson;

  /// Refresh Token
  @override
  String get refreshToken;

  /// Create a copy of ReissueRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReissueRequestImplCopyWith<_$ReissueRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
