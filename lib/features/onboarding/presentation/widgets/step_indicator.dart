import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../providers/onboarding_provider.dart';

/// 온보딩 진행 표시기
class StepIndicator extends StatelessWidget {
  final OnboardingStep currentStep;
  final int totalSteps;

  const StepIndicator({
    super.key,
    required this.currentStep,
    this.totalSteps = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalSteps,
        (index) => _buildDot(index),
      ),
    );
  }

  Widget _buildDot(int index) {
    final isActive = index == currentStep.index;
    final isCompleted = index < currentStep.index;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      width: isActive ? 24.w : 8.w,
      height: 8.h,
      decoration: BoxDecoration(
        color: isActive || isCompleted ? AppColors.primary : AppColors.gray300,
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }
}

/// 온보딩 진행률 바
class StepProgressBar extends StatelessWidget {
  final OnboardingStep currentStep;
  final int totalSteps;

  const StepProgressBar({
    super.key,
    required this.currentStep,
    this.totalSteps = 4,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (currentStep.index + 1) / totalSteps;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _getStepText(),
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.gray600,
              ),
            ),
            Text(
              '${currentStep.index + 1}/$totalSteps',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: AppColors.gray200,
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
          minHeight: 4.h,
          borderRadius: BorderRadius.circular(2.r),
        ),
      ],
    );
  }

  String _getStepText() {
    switch (currentStep) {
      case OnboardingStep.terms:
        return '약관 동의';
      case OnboardingStep.birthDate:
        return '생년월일';
      case OnboardingStep.gender:
        return '성별';
      case OnboardingStep.nickname:
        return '닉네임';
      case OnboardingStep.completed:
        return '완료';
    }
  }
}
