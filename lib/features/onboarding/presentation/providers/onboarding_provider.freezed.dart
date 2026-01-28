// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OnboardingState {
  /// 현재 단계
  OnboardingStep get currentStep => throw _privateConstructorUsedError;

  /// 약관 동의 상태
  bool get serviceAgreed => throw _privateConstructorUsedError;
  bool get privacyAgreed => throw _privateConstructorUsedError;
  bool get marketingAgreed => throw _privateConstructorUsedError;

  /// 생년월일
  DateTime? get birthDate => throw _privateConstructorUsedError;

  /// 성별
  Gender? get gender => throw _privateConstructorUsedError;

  /// 닉네임
  String? get nickname => throw _privateConstructorUsedError;

  /// 닉네임 사용 가능 여부 (null = 확인 안함)
  bool? get nicknameAvailable => throw _privateConstructorUsedError;

  /// 로딩 상태
  bool get isLoading => throw _privateConstructorUsedError;

  /// 에러 메시지
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
    OnboardingState value,
    $Res Function(OnboardingState) then,
  ) = _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
  @useResult
  $Res call({
    OnboardingStep currentStep,
    bool serviceAgreed,
    bool privacyAgreed,
    bool marketingAgreed,
    DateTime? birthDate,
    Gender? gender,
    String? nickname,
    bool? nicknameAvailable,
    bool isLoading,
    String? errorMessage,
  });
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? serviceAgreed = null,
    Object? privacyAgreed = null,
    Object? marketingAgreed = null,
    Object? birthDate = freezed,
    Object? gender = freezed,
    Object? nickname = freezed,
    Object? nicknameAvailable = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            currentStep: null == currentStep
                ? _value.currentStep
                : currentStep // ignore: cast_nullable_to_non_nullable
                      as OnboardingStep,
            serviceAgreed: null == serviceAgreed
                ? _value.serviceAgreed
                : serviceAgreed // ignore: cast_nullable_to_non_nullable
                      as bool,
            privacyAgreed: null == privacyAgreed
                ? _value.privacyAgreed
                : privacyAgreed // ignore: cast_nullable_to_non_nullable
                      as bool,
            marketingAgreed: null == marketingAgreed
                ? _value.marketingAgreed
                : marketingAgreed // ignore: cast_nullable_to_non_nullable
                      as bool,
            birthDate: freezed == birthDate
                ? _value.birthDate
                : birthDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as Gender?,
            nickname: freezed == nickname
                ? _value.nickname
                : nickname // ignore: cast_nullable_to_non_nullable
                      as String?,
            nicknameAvailable: freezed == nicknameAvailable
                ? _value.nicknameAvailable
                : nicknameAvailable // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OnboardingStateImplCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$OnboardingStateImplCopyWith(
    _$OnboardingStateImpl value,
    $Res Function(_$OnboardingStateImpl) then,
  ) = __$$OnboardingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    OnboardingStep currentStep,
    bool serviceAgreed,
    bool privacyAgreed,
    bool marketingAgreed,
    DateTime? birthDate,
    Gender? gender,
    String? nickname,
    bool? nicknameAvailable,
    bool isLoading,
    String? errorMessage,
  });
}

/// @nodoc
class __$$OnboardingStateImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingStateImpl>
    implements _$$OnboardingStateImplCopyWith<$Res> {
  __$$OnboardingStateImplCopyWithImpl(
    _$OnboardingStateImpl _value,
    $Res Function(_$OnboardingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? serviceAgreed = null,
    Object? privacyAgreed = null,
    Object? marketingAgreed = null,
    Object? birthDate = freezed,
    Object? gender = freezed,
    Object? nickname = freezed,
    Object? nicknameAvailable = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$OnboardingStateImpl(
        currentStep: null == currentStep
            ? _value.currentStep
            : currentStep // ignore: cast_nullable_to_non_nullable
                  as OnboardingStep,
        serviceAgreed: null == serviceAgreed
            ? _value.serviceAgreed
            : serviceAgreed // ignore: cast_nullable_to_non_nullable
                  as bool,
        privacyAgreed: null == privacyAgreed
            ? _value.privacyAgreed
            : privacyAgreed // ignore: cast_nullable_to_non_nullable
                  as bool,
        marketingAgreed: null == marketingAgreed
            ? _value.marketingAgreed
            : marketingAgreed // ignore: cast_nullable_to_non_nullable
                  as bool,
        birthDate: freezed == birthDate
            ? _value.birthDate
            : birthDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as Gender?,
        nickname: freezed == nickname
            ? _value.nickname
            : nickname // ignore: cast_nullable_to_non_nullable
                  as String?,
        nicknameAvailable: freezed == nicknameAvailable
            ? _value.nicknameAvailable
            : nicknameAvailable // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$OnboardingStateImpl
    with DiagnosticableTreeMixin
    implements _OnboardingState {
  const _$OnboardingStateImpl({
    this.currentStep = OnboardingStep.terms,
    this.serviceAgreed = false,
    this.privacyAgreed = false,
    this.marketingAgreed = false,
    this.birthDate,
    this.gender,
    this.nickname,
    this.nicknameAvailable,
    this.isLoading = false,
    this.errorMessage,
  });

  /// 현재 단계
  @override
  @JsonKey()
  final OnboardingStep currentStep;

  /// 약관 동의 상태
  @override
  @JsonKey()
  final bool serviceAgreed;
  @override
  @JsonKey()
  final bool privacyAgreed;
  @override
  @JsonKey()
  final bool marketingAgreed;

  /// 생년월일
  @override
  final DateTime? birthDate;

  /// 성별
  @override
  final Gender? gender;

  /// 닉네임
  @override
  final String? nickname;

  /// 닉네임 사용 가능 여부 (null = 확인 안함)
  @override
  final bool? nicknameAvailable;

  /// 로딩 상태
  @override
  @JsonKey()
  final bool isLoading;

  /// 에러 메시지
  @override
  final String? errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OnboardingState(currentStep: $currentStep, serviceAgreed: $serviceAgreed, privacyAgreed: $privacyAgreed, marketingAgreed: $marketingAgreed, birthDate: $birthDate, gender: $gender, nickname: $nickname, nicknameAvailable: $nicknameAvailable, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OnboardingState'))
      ..add(DiagnosticsProperty('currentStep', currentStep))
      ..add(DiagnosticsProperty('serviceAgreed', serviceAgreed))
      ..add(DiagnosticsProperty('privacyAgreed', privacyAgreed))
      ..add(DiagnosticsProperty('marketingAgreed', marketingAgreed))
      ..add(DiagnosticsProperty('birthDate', birthDate))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('nickname', nickname))
      ..add(DiagnosticsProperty('nicknameAvailable', nicknameAvailable))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingStateImpl &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.serviceAgreed, serviceAgreed) ||
                other.serviceAgreed == serviceAgreed) &&
            (identical(other.privacyAgreed, privacyAgreed) ||
                other.privacyAgreed == privacyAgreed) &&
            (identical(other.marketingAgreed, marketingAgreed) ||
                other.marketingAgreed == marketingAgreed) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.nicknameAvailable, nicknameAvailable) ||
                other.nicknameAvailable == nicknameAvailable) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentStep,
    serviceAgreed,
    privacyAgreed,
    marketingAgreed,
    birthDate,
    gender,
    nickname,
    nicknameAvailable,
    isLoading,
    errorMessage,
  );

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      __$$OnboardingStateImplCopyWithImpl<_$OnboardingStateImpl>(
        this,
        _$identity,
      );
}

abstract class _OnboardingState implements OnboardingState {
  const factory _OnboardingState({
    final OnboardingStep currentStep,
    final bool serviceAgreed,
    final bool privacyAgreed,
    final bool marketingAgreed,
    final DateTime? birthDate,
    final Gender? gender,
    final String? nickname,
    final bool? nicknameAvailable,
    final bool isLoading,
    final String? errorMessage,
  }) = _$OnboardingStateImpl;

  /// 현재 단계
  @override
  OnboardingStep get currentStep;

  /// 약관 동의 상태
  @override
  bool get serviceAgreed;
  @override
  bool get privacyAgreed;
  @override
  bool get marketingAgreed;

  /// 생년월일
  @override
  DateTime? get birthDate;

  /// 성별
  @override
  Gender? get gender;

  /// 닉네임
  @override
  String? get nickname;

  /// 닉네임 사용 가능 여부 (null = 확인 안함)
  @override
  bool? get nicknameAvailable;

  /// 로딩 상태
  @override
  bool get isLoading;

  /// 에러 메시지
  @override
  String? get errorMessage;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
