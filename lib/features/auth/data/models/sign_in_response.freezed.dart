// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) {
  return _SignInResponse.fromJson(json);
}

/// @nodoc
mixin _$SignInResponse {
  /// API 인증용 JWT Access Token
  String get accessToken => throw _privateConstructorUsedError;

  /// Access Token 갱신용 Refresh Token
  String get refreshToken => throw _privateConstructorUsedError;

  /// 첫 로그인 여부
  bool get isFirstLogin => throw _privateConstructorUsedError;

  /// 온보딩 완료 필요 여부
  bool get requiresOnboarding => throw _privateConstructorUsedError;

  /// 현재 온보딩 단계: TERMS, BIRTH_DATE, GENDER, NICKNAME, COMPLETED
  String? get onboardingStep => throw _privateConstructorUsedError;

  /// Serializes this SignInResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignInResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInResponseCopyWith<SignInResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInResponseCopyWith<$Res> {
  factory $SignInResponseCopyWith(
    SignInResponse value,
    $Res Function(SignInResponse) then,
  ) = _$SignInResponseCopyWithImpl<$Res, SignInResponse>;
  @useResult
  $Res call({
    String accessToken,
    String refreshToken,
    bool isFirstLogin,
    bool requiresOnboarding,
    String? onboardingStep,
  });
}

/// @nodoc
class _$SignInResponseCopyWithImpl<$Res, $Val extends SignInResponse>
    implements $SignInResponseCopyWith<$Res> {
  _$SignInResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? isFirstLogin = null,
    Object? requiresOnboarding = null,
    Object? onboardingStep = freezed,
  }) {
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
            isFirstLogin: null == isFirstLogin
                ? _value.isFirstLogin
                : isFirstLogin // ignore: cast_nullable_to_non_nullable
                      as bool,
            requiresOnboarding: null == requiresOnboarding
                ? _value.requiresOnboarding
                : requiresOnboarding // ignore: cast_nullable_to_non_nullable
                      as bool,
            onboardingStep: freezed == onboardingStep
                ? _value.onboardingStep
                : onboardingStep // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SignInResponseImplCopyWith<$Res>
    implements $SignInResponseCopyWith<$Res> {
  factory _$$SignInResponseImplCopyWith(
    _$SignInResponseImpl value,
    $Res Function(_$SignInResponseImpl) then,
  ) = __$$SignInResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accessToken,
    String refreshToken,
    bool isFirstLogin,
    bool requiresOnboarding,
    String? onboardingStep,
  });
}

/// @nodoc
class __$$SignInResponseImplCopyWithImpl<$Res>
    extends _$SignInResponseCopyWithImpl<$Res, _$SignInResponseImpl>
    implements _$$SignInResponseImplCopyWith<$Res> {
  __$$SignInResponseImplCopyWithImpl(
    _$SignInResponseImpl _value,
    $Res Function(_$SignInResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SignInResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? isFirstLogin = null,
    Object? requiresOnboarding = null,
    Object? onboardingStep = freezed,
  }) {
    return _then(
      _$SignInResponseImpl(
        accessToken: null == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String,
        refreshToken: null == refreshToken
            ? _value.refreshToken
            : refreshToken // ignore: cast_nullable_to_non_nullable
                  as String,
        isFirstLogin: null == isFirstLogin
            ? _value.isFirstLogin
            : isFirstLogin // ignore: cast_nullable_to_non_nullable
                  as bool,
        requiresOnboarding: null == requiresOnboarding
            ? _value.requiresOnboarding
            : requiresOnboarding // ignore: cast_nullable_to_non_nullable
                  as bool,
        onboardingStep: freezed == onboardingStep
            ? _value.onboardingStep
            : onboardingStep // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInResponseImpl implements _SignInResponse {
  const _$SignInResponseImpl({
    required this.accessToken,
    required this.refreshToken,
    this.isFirstLogin = false,
    this.requiresOnboarding = false,
    this.onboardingStep,
  });

  factory _$SignInResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInResponseImplFromJson(json);

  /// API 인증용 JWT Access Token
  @override
  final String accessToken;

  /// Access Token 갱신용 Refresh Token
  @override
  final String refreshToken;

  /// 첫 로그인 여부
  @override
  @JsonKey()
  final bool isFirstLogin;

  /// 온보딩 완료 필요 여부
  @override
  @JsonKey()
  final bool requiresOnboarding;

  /// 현재 온보딩 단계: TERMS, BIRTH_DATE, GENDER, NICKNAME, COMPLETED
  @override
  final String? onboardingStep;

  @override
  String toString() {
    return 'SignInResponse(accessToken: $accessToken, refreshToken: $refreshToken, isFirstLogin: $isFirstLogin, requiresOnboarding: $requiresOnboarding, onboardingStep: $onboardingStep)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.isFirstLogin, isFirstLogin) ||
                other.isFirstLogin == isFirstLogin) &&
            (identical(other.requiresOnboarding, requiresOnboarding) ||
                other.requiresOnboarding == requiresOnboarding) &&
            (identical(other.onboardingStep, onboardingStep) ||
                other.onboardingStep == onboardingStep));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accessToken,
    refreshToken,
    isFirstLogin,
    requiresOnboarding,
    onboardingStep,
  );

  /// Create a copy of SignInResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInResponseImplCopyWith<_$SignInResponseImpl> get copyWith =>
      __$$SignInResponseImplCopyWithImpl<_$SignInResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInResponseImplToJson(this);
  }
}

abstract class _SignInResponse implements SignInResponse {
  const factory _SignInResponse({
    required final String accessToken,
    required final String refreshToken,
    final bool isFirstLogin,
    final bool requiresOnboarding,
    final String? onboardingStep,
  }) = _$SignInResponseImpl;

  factory _SignInResponse.fromJson(Map<String, dynamic> json) =
      _$SignInResponseImpl.fromJson;

  /// API 인증용 JWT Access Token
  @override
  String get accessToken;

  /// Access Token 갱신용 Refresh Token
  @override
  String get refreshToken;

  /// 첫 로그인 여부
  @override
  bool get isFirstLogin;

  /// 온보딩 완료 필요 여부
  @override
  bool get requiresOnboarding;

  /// 현재 온보딩 단계: TERMS, BIRTH_DATE, GENDER, NICKNAME, COMPLETED
  @override
  String? get onboardingStep;

  /// Create a copy of SignInResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInResponseImplCopyWith<_$SignInResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
