import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../router/route_paths.dart';
import '../../data/models/gender_request.dart';
import '../providers/onboarding_provider.dart';
import '../widgets/onboarding_button.dart';
import '../widgets/step_indicator.dart';

/// 성별 선택 화면
class GenderStepPage extends ConsumerWidget {
  const GenderStepPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingNotifierProvider);
    final notifier = ref.read(onboardingNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.gray700),
          onPressed: () => context.go(RoutePaths.onboardingBirthDate),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 진행 표시기
              const StepIndicator(currentStep: OnboardingStep.gender),
              SizedBox(height: 32.h),

              // 타이틀
              Text(
                '성별을\n알려주세요',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.gray900,
                  height: 1.3,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                '맞춤 콘텐츠 추천을 위해 사용됩니다.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.gray600,
                ),
              ),
              SizedBox(height: 48.h),

              // 성별 선택 버튼들
              Row(
                children: [
                  Expanded(
                    child: _GenderButton(
                      label: '남성',
                      icon: Icons.male,
                      isSelected: state.gender == Gender.male,
                      onTap: () => notifier.setGender(Gender.male),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _GenderButton(
                      label: '여성',
                      icon: Icons.female,
                      isSelected: state.gender == Gender.female,
                      onTap: () => notifier.setGender(Gender.female),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              _GenderButton(
                label: '기타',
                icon: Icons.person_outline,
                isSelected: state.gender == Gender.other,
                onTap: () => notifier.setGender(Gender.other),
              ),

              const Spacer(),

              // 에러 메시지
              if (state.errorMessage != null) ...[
                Text(
                  state.errorMessage!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.error,
                  ),
                ),
                SizedBox(height: 8.h),
              ],

              // 다음 버튼
              OnboardingButton(
                text: '다음',
                isLoading: state.isLoading,
                onPressed: state.gender != null
                    ? () async {
                        final success = await notifier.submitGender();
                        if (success && context.mounted) {
                          context.go(RoutePaths.onboardingNickname);
                        }
                      }
                    : null,
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}

/// 성별 선택 버튼
class _GenderButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderButton({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : AppColors.gray100,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.gray200,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.w,
              color: isSelected ? AppColors.primary : AppColors.gray500,
            ),
            SizedBox(height: 12.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? AppColors.primary : AppColors.gray700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
