// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reissue_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReissueResponse _$ReissueResponseFromJson(Map<String, dynamic> json) {
  return _ReissueResponse.fromJson(json);
}

/// @nodoc
mixin _$ReissueResponse {
  /// 새로운 Access Token
  String get accessToken => throw _privateConstructorUsedError;

  /// 새로운 Refresh Token
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this ReissueResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReissueResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReissueResponseCopyWith<ReissueResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReissueResponseCopyWith<$Res> {
  factory $ReissueResponseCopyWith(
    ReissueResponse value,
    $Res Function(ReissueResponse) then,
  ) = _$ReissueResponseCopyWithImpl<$Res, ReissueResponse>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$ReissueResponseCopyWithImpl<$Res, $Val extends ReissueResponse>
    implements $ReissueResponseCopyWith<$Res> {
  _$ReissueResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReissueResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accessToken = null, Object? refreshToken = null}) {
    return _then(
      _value.copyWith(
            accessToken: null == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$ReissueResponseImplCopyWith<$Res>
    implements $ReissueResponseCopyWith<$Res> {
  factory _$$ReissueResponseImplCopyWith(
    _$ReissueResponseImpl value,
    $Res Function(_$ReissueResponseImpl) then,
  ) = __$$ReissueResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$ReissueResponseImplCopyWithImpl<$Res>
    extends _$ReissueResponseCopyWithImpl<$Res, _$ReissueResponseImpl>
    implements _$$ReissueResponseImplCopyWith<$Res> {
  __$$ReissueResponseImplCopyWithImpl(
    _$ReissueResponseImpl _value,
    $Res Function(_$ReissueResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReissueResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accessToken = null, Object? refreshToken = null}) {
    return _then(
      _$ReissueResponseImpl(
        accessToken: null == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$ReissueResponseImpl implements _ReissueResponse {
  const _$ReissueResponseImpl({
    required this.accessToken,
    required this.refreshToken,
  });

  factory _$ReissueResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReissueResponseImplFromJson(json);

  /// 새로운 Access Token
  @override
  final String accessToken;

  /// 새로운 Refresh Token
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'ReissueResponse(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReissueResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  /// Create a copy of ReissueResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReissueResponseImplCopyWith<_$ReissueResponseImpl> get copyWith =>
      __$$ReissueResponseImplCopyWithImpl<_$ReissueResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReissueResponseImplToJson(this);
  }
}

abstract class _ReissueResponse implements ReissueResponse {
  const factory _ReissueResponse({
    required final String accessToken,
    required final String refreshToken,
  }) = _$ReissueResponseImpl;

  factory _ReissueResponse.fromJson(Map<String, dynamic> json) =
      _$ReissueResponseImpl.fromJson;

  /// 새로운 Access Token
  @override
  String get accessToken;

  /// 새로운 Refresh Token
  @override
  String get refreshToken;

  /// Create a copy of ReissueResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReissueResponseImplCopyWith<_$ReissueResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
