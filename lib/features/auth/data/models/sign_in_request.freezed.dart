// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SignInRequest _$SignInRequestFromJson(Map<String, dynamic> json) {
  return _SignInRequest.fromJson(json);
}

/// @nodoc
mixin _$SignInRequest {
  /// Firebase ID Token (필수)
  String get firebaseIdToken => throw _privateConstructorUsedError;

  /// FCM 푸시 알림 토큰 (선택)
  String? get fcmToken => throw _privateConstructorUsedError;

  /// 디바이스 타입: IOS, ANDROID (선택)
  String? get deviceType => throw _privateConstructorUsedError;

  /// 디바이스 고유 식별자 UUID (선택)
  String? get deviceId => throw _privateConstructorUsedError;

  /// Serializes this SignInRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignInRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInRequestCopyWith<SignInRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInRequestCopyWith<$Res> {
  factory $SignInRequestCopyWith(
    SignInRequest value,
    $Res Function(SignInRequest) then,
  ) = _$SignInRequestCopyWithImpl<$Res, SignInRequest>;
  @useResult
  $Res call({
    String firebaseIdToken,
    String? fcmToken,
    String? deviceType,
    String? deviceId,
  });
}

/// @nodoc
class _$SignInRequestCopyWithImpl<$Res, $Val extends SignInRequest>
    implements $SignInRequestCopyWith<$Res> {
  _$SignInRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firebaseIdToken = null,
    Object? fcmToken = freezed,
    Object? deviceType = freezed,
    Object? deviceId = freezed,
  }) {
    return _then(
      _value.copyWith(
            firebaseIdToken: null == firebaseIdToken
                ? _value.firebaseIdToken
                : firebaseIdToken // ignore: cast_nullable_to_non_nullable
                      as String,
            fcmToken: freezed == fcmToken
                ? _value.fcmToken
                : fcmToken // ignore: cast_nullable_to_non_nullable
                      as String?,
            deviceType: freezed == deviceType
                ? _value.deviceType
                : deviceType // ignore: cast_nullable_to_non_nullable
                      as String?,
            deviceId: freezed == deviceId
                ? _value.deviceId
                : deviceId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SignInRequestImplCopyWith<$Res>
    implements $SignInRequestCopyWith<$Res> {
  factory _$$SignInRequestImplCopyWith(
    _$SignInRequestImpl value,
    $Res Function(_$SignInRequestImpl) then,
  ) = __$$SignInRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String firebaseIdToken,
    String? fcmToken,
    String? deviceType,
    String? deviceId,
  });
}

/// @nodoc
class __$$SignInRequestImplCopyWithImpl<$Res>
    extends _$SignInRequestCopyWithImpl<$Res, _$SignInRequestImpl>
    implements _$$SignInRequestImplCopyWith<$Res> {
  __$$SignInRequestImplCopyWithImpl(
    _$SignInRequestImpl _value,
    $Res Function(_$SignInRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SignInRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firebaseIdToken = null,
    Object? fcmToken = freezed,
    Object? deviceType = freezed,
    Object? deviceId = freezed,
  }) {
    return _then(
      _$SignInRequestImpl(
        firebaseIdToken: null == firebaseIdToken
            ? _value.firebaseIdToken
            : firebaseIdToken // ignore: cast_nullable_to_non_nullable
                  as String,
        fcmToken: freezed == fcmToken
            ? _value.fcmToken
            : fcmToken // ignore: cast_nullable_to_non_nullable
                  as String?,
        deviceType: freezed == deviceType
            ? _value.deviceType
            : deviceType // ignore: cast_nullable_to_non_nullable
                  as String?,
        deviceId: freezed == deviceId
            ? _value.deviceId
            : deviceId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInRequestImpl implements _SignInRequest {
  const _$SignInRequestImpl({
    required this.firebaseIdToken,
    this.fcmToken,
    this.deviceType,
    this.deviceId,
  });

  factory _$SignInRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInRequestImplFromJson(json);

  /// Firebase ID Token (필수)
  @override
  final String firebaseIdToken;

  /// FCM 푸시 알림 토큰 (선택)
  @override
  final String? fcmToken;

  /// 디바이스 타입: IOS, ANDROID (선택)
  @override
  final String? deviceType;

  /// 디바이스 고유 식별자 UUID (선택)
  @override
  final String? deviceId;

  @override
  String toString() {
    return 'SignInRequest(firebaseIdToken: $firebaseIdToken, fcmToken: $fcmToken, deviceType: $deviceType, deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInRequestImpl &&
            (identical(other.firebaseIdToken, firebaseIdToken) ||
                other.firebaseIdToken == firebaseIdToken) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, firebaseIdToken, fcmToken, deviceType, deviceId);

  /// Create a copy of SignInRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInRequestImplCopyWith<_$SignInRequestImpl> get copyWith =>
      __$$SignInRequestImplCopyWithImpl<_$SignInRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInRequestImplToJson(this);
  }
}

abstract class _SignInRequest implements SignInRequest {
  const factory _SignInRequest({
    required final String firebaseIdToken,
    final String? fcmToken,
    final String? deviceType,
    final String? deviceId,
  }) = _$SignInRequestImpl;

  factory _SignInRequest.fromJson(Map<String, dynamic> json) =
      _$SignInRequestImpl.fromJson;

  /// Firebase ID Token (필수)
  @override
  String get firebaseIdToken;

  /// FCM 푸시 알림 토큰 (선택)
  @override
  String? get fcmToken;

  /// 디바이스 타입: IOS, ANDROID (선택)
  @override
  String? get deviceType;

  /// 디바이스 고유 식별자 UUID (선택)
  @override
  String? get deviceId;

  /// Create a copy of SignInRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInRequestImplCopyWith<_$SignInRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
