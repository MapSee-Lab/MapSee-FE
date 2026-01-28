import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../router/route_paths.dart';
import '../providers/onboarding_provider.dart';
import '../widgets/onboarding_button.dart';
import '../widgets/step_indicator.dart';

/// 생년월일 입력 화면
class BirthDateStepPage extends ConsumerStatefulWidget {
  const BirthDateStepPage({super.key});

  @override
  ConsumerState<BirthDateStepPage> createState() => _BirthDateStepPageState();
}

class _BirthDateStepPageState extends ConsumerState<BirthDateStepPage> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    // 기본값: 20년 전
    _selectedDate = DateTime.now().subtract(const Duration(days: 365 * 20));
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingNotifierProvider);
    final notifier = ref.read(onboardingNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.gray700),
          onPressed: () => context.go(RoutePaths.onboardingTerms),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 진행 표시기
              const StepIndicator(currentStep: OnboardingStep.birthDate),
              SizedBox(height: 32.h),

              // 타이틀
              Text(
                '생년월일을\n알려주세요',
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

              // 날짜 선택 표시
              _DateDisplay(
                date: state.birthDate ?? _selectedDate,
                onTap: () => _showDatePicker(context, notifier),
              ),
              SizedBox(height: 24.h),

              // 날짜 선택 버튼
              OutlinedButton.icon(
                onPressed: () => _showDatePicker(context, notifier),
                icon: const Icon(Icons.calendar_today),
                label: const Text('날짜 선택하기'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary),
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
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
                onPressed: state.birthDate != null
                    ? () async {
                        final success = await notifier.submitBirthDate();
                        if (success && context.mounted) {
                          context.go(RoutePaths.onboardingGender);
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

  void _showDatePicker(BuildContext context, OnboardingNotifier notifier) {
    final now = DateTime.now();
    final minDate = DateTime(now.year - 100);
    final maxDate = DateTime(now.year - 10); // 최소 10세 이상

    showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        height: 300.h,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: const BoxDecoration(
                color: AppColors.gray100,
                border: Border(
                  bottom: BorderSide(color: AppColors.gray200),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      '취소',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.gray600,
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      '확인',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      notifier.setBirthDate(_selectedDate);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: _selectedDate,
                minimumDate: minDate,
                maximumDate: maxDate,
                onDateTimeChanged: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 날짜 표시 위젯
class _DateDisplay extends StatelessWidget {
  final DateTime date;
  final VoidCallback onTap;

  const _DateDisplay({
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppColors.gray100,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.gray200),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _DateBox(value: date.year.toString(), label: '년'),
            SizedBox(width: 16.w),
            _DateBox(value: date.month.toString().padLeft(2, '0'), label: '월'),
            SizedBox(width: 16.w),
            _DateBox(value: date.day.toString().padLeft(2, '0'), label: '일'),
          ],
        ),
      ),
    );
  }
}

class _DateBox extends StatelessWidget {
  final String value;
  final String label;

  const _DateBox({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.gray900,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.gray500,
          ),
        ),
      ],
    );
  }
}
