import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/errors/app_exception.dart';
import '../../data/models/gender_request.dart';
import '../../data/models/profile_request.dart';
import '../../data/repositories/onboarding_repository_impl.dart';
import '../../domain/repositories/onboarding_repository.dart';

part 'onboarding_provider.freezed.dart';
part 'onboarding_provider.g.dart';

/// 온보딩 단계 열거형
enum OnboardingStep {
  terms,
  birthDate,
  gender,
  nickname,
  completed;

  /// 문자열에서 OnboardingStep으로 변환
  static OnboardingStep fromString(String? step) {
    switch (step?.toUpperCase()) {
      case 'TERMS':
        return OnboardingStep.terms;
      case 'BIRTH_DATE':
        return OnboardingStep.birthDate;
      case 'GENDER':
        return OnboardingStep.gender;
      case 'NICKNAME':
        return OnboardingStep.nickname;
      case 'COMPLETED':
        return OnboardingStep.completed;
      default:
        return OnboardingStep.terms;
    }
  }

  /// 다음 단계 반환
  OnboardingStep? get next {
    switch (this) {
      case OnboardingStep.terms:
        return OnboardingStep.birthDate;
      case OnboardingStep.birthDate:
        return OnboardingStep.gender;
      case OnboardingStep.gender:
        return OnboardingStep.nickname;
      case OnboardingStep.nickname:
        return OnboardingStep.completed;
      case OnboardingStep.completed:
        return null;
    }
  }

  /// 단계 인덱스 (0-3)
  int get index {
    switch (this) {
      case OnboardingStep.terms:
        return 0;
      case OnboardingStep.birthDate:
        return 1;
      case OnboardingStep.gender:
        return 2;
      case OnboardingStep.nickname:
        return 3;
      case OnboardingStep.completed:
        return 4;
    }
  }
}

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

  /// 닉네임 설정
  void setNickname(String nickname) {
    state = state.copyWith(
      nickname: nickname,
      nicknameAvailable: null, // 닉네임 변경 시 확인 상태 초기화
    );
  }

  /// 닉네임 중복 확인
  Future<bool> checkNickname() async {
    final nickname = state.nickname;
    if (nickname == null || nickname.isEmpty) return false;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final response = await _repository.checkName(nickname);

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
