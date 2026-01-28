import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../auth/domain/entities/onboarding_step.dart';
import '../../data/models/gender_request.dart';
import '../../data/models/profile_request.dart';
import '../../data/repositories/onboarding_repository_impl.dart';
import '../../domain/repositories/onboarding_repository.dart';

// OnboardingStep re-export for convenience
export '../../../auth/domain/entities/onboarding_step.dart';

part 'onboarding_provider.freezed.dart';
part 'onboarding_provider.g.dart';

/// 온보딩 상태
@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    /// 현재 단계
    @Default(OnboardingStep.terms) OnboardingStep currentStep,

    /// 약관 동의 상태
    @Default(false) bool serviceAgreed,
    @Default(false) bool privacyAgreed,
    @Default(false) bool marketingAgreed,

    /// 생년월일
    DateTime? birthDate,

    /// 성별
    Gender? gender,

    /// 닉네임
    String? nickname,

    /// 닉네임 사용 가능 여부 (null = 확인 안함)
    bool? nicknameAvailable,

    /// 로딩 상태
    @Default(false) bool isLoading,

    /// 에러 메시지
    String? errorMessage,
  }) = _OnboardingState;
}

/// 온보딩 Notifier
@riverpod
class OnboardingNotifier extends _$OnboardingNotifier {
  @override
  OnboardingState build() {
    return const OnboardingState();
  }

  OnboardingRepository get _repository => ref.read(onboardingRepositoryProvider);

  /// 현재 단계 설정 (라우터에서 호출)
  void setCurrentStep(OnboardingStep step) {
    state = state.copyWith(currentStep: step);
  }

  /// 서비스 약관 동의 토글
  void toggleServiceAgreement() {
    state = state.copyWith(serviceAgreed: !state.serviceAgreed);
  }

  /// 개인정보 처리방침 동의 토글
  void togglePrivacyAgreement() {
    state = state.copyWith(privacyAgreed: !state.privacyAgreed);
  }

  /// 마케팅 수신 동의 토글
  void toggleMarketingAgreement() {
    state = state.copyWith(marketingAgreed: !state.marketingAgreed);
  }

  /// 전체 동의 (필수 약관만)
  void agreeAll() {
    state = state.copyWith(
      serviceAgreed: true,
      privacyAgreed: true,
      marketingAgreed: true,
    );
  }

  /// 약관 제출 가능 여부
  bool get canSubmitTerms => state.serviceAgreed && state.privacyAgreed;

  /// 약관 동의 제출
  Future<bool> submitTerms() async {
    if (!canSubmitTerms) return false;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await _repository.submitTerms(
        serviceAgreement: state.serviceAgreed,
        privacyAgreement: state.privacyAgreed,
        marketingAgreement: state.marketingAgreed,
      );

      state = state.copyWith(
        isLoading: false,
        currentStep: OnboardingStep.birthDate,
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: _getErrorMessage(e),
      );
      return false;
    }
  }

  /// 생년월일 설정
  void setBirthDate(DateTime date) {
    state = state.copyWith(birthDate: date);
  }

  /// 생년월일 제출 가능 여부
  bool get canSubmitBirthDate => state.birthDate != null;

  /// 생년월일 제출
  Future<bool> submitBirthDate() async {
    if (!canSubmitBirthDate || state.birthDate == null) return false;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await _repository.submitBirthDate(state.birthDate!);

      state = state.copyWith(
        isLoading: false,
        currentStep: OnboardingStep.gender,
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: _getErrorMessage(e),
      );
      return false;
    }
  }

  /// 성별 설정
  void setGender(Gender gender) {
    state = state.copyWith(gender: gender);
  }

  /// 성별 제출 가능 여부
  bool get canSubmitGender => state.gender != null;

  /// 성별 제출
  Future<bool> submitGender() async {
    if (!canSubmitGender || state.gender == null) return false;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await _repository.submitGender(state.gender!);

      state = state.copyWith(
        isLoading: false,
        currentStep: OnboardingStep.nickname,
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: _getErrorMessage(e),
      );
      return false;
    }
  }

  // ============================================
  // 닉네임 관련 상수
  // ============================================
  static const int _minNicknameLength = 2;
  static const int _maxNicknameLength = 20;

  /// 닉네임 유효성 검증 정규식 (한글, 영문, 숫자만 허용)
  static final RegExp _nicknameRegex = RegExp(r'^[가-힣a-zA-Z0-9]+$');

  /// 닉네임 설정
  void setNickname(String nickname) {
    state = state.copyWith(
      nickname: nickname,
      nicknameAvailable: null, // 닉네임 변경 시 확인 상태 초기화
      errorMessage: null,
    );
  }

  /// 닉네임 유효성 검증
  ///
  /// **규칙**:
  /// - 2~20자 이내
  /// - 한글, 영문, 숫자만 사용 가능
  /// - 특수문자 및 공백 불가
  ///
  /// Returns: 유효하면 null, 유효하지 않으면 에러 메시지
  String? validateNickname(String? nickname) {
    if (nickname == null || nickname.isEmpty) {
      return '닉네임을 입력해주세요.';
    }
    if (nickname.length < _minNicknameLength) {
      return '닉네임은 $_minNicknameLength자 이상이어야 합니다.';
    }
    if (nickname.length > _maxNicknameLength) {
      return '닉네임은 $_maxNicknameLength자 이하여야 합니다.';
    }
    if (nickname.contains(' ')) {
      return '닉네임에 공백을 사용할 수 없습니다.';
    }
    if (!_nicknameRegex.hasMatch(nickname)) {
      return '닉네임은 한글, 영문, 숫자만 사용할 수 있습니다.';
    }
    return null; // 유효함
  }

  /// 닉네임이 유효한지 확인 (불린 반환)
  bool isNicknameFormatValid(String? nickname) {
    return validateNickname(nickname) == null;
  }

  /// 닉네임 중복 확인
  ///
  /// 닉네임 형식이 유효한 경우에만 서버에 중복 확인 요청
  Future<bool> checkNickname() async {
    final nickname = state.nickname;

    // 형식 유효성 검증 먼저 수행
    final validationError = validateNickname(nickname);
    if (validationError != null) {
      state = state.copyWith(
        nicknameAvailable: false,
        errorMessage: validationError,
      );
      return false;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final response = await _repository.checkName(nickname!);

      state = state.copyWith(
        isLoading: false,
        nicknameAvailable: response.available,
        errorMessage: response.available ? null : response.message ?? '이미 사용 중인 닉네임입니다.',
      );

      return response.available;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        nicknameAvailable: false,
        errorMessage: _getErrorMessage(e),
      );
      return false;
    }
  }

  /// 닉네임 제출 가능 여부
  bool get canSubmitNickname =>
      state.nickname != null &&
      state.nickname!.isNotEmpty &&
      isNicknameFormatValid(state.nickname) &&
      state.nicknameAvailable == true;

  /// 프로필(닉네임) 제출
  Future<bool> submitProfile() async {
    if (!canSubmitNickname || state.nickname == null) return false;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await _repository.submitProfile(state.nickname!);

      state = state.copyWith(
        isLoading: false,
        currentStep: OnboardingStep.completed,
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: _getErrorMessage(e),
      );
      return false;
    }
  }

  /// 에러 메시지 초기화
  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  /// 에러 메시지 추출
  String _getErrorMessage(Object error) {
    if (error is AppException) {
      return error.message;
    }
    debugPrint('❌ OnboardingNotifier error: $error');
    return '오류가 발생했습니다. 다시 시도해주세요.';
  }
}
