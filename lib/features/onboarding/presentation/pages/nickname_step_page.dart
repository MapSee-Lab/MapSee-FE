import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../router/route_paths.dart';
import '../providers/onboarding_provider.dart';
import '../widgets/onboarding_button.dart';
import '../widgets/step_indicator.dart';

/// 닉네임 입력 화면
class NicknameStepPage extends ConsumerStatefulWidget {
  const NicknameStepPage({super.key});

  @override
  ConsumerState<NicknameStepPage> createState() => _NicknameStepPageState();
}

class _NicknameStepPageState extends ConsumerState<NicknameStepPage> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onNicknameChanged(String value, OnboardingNotifier notifier) {
    notifier.setNickname(value);

    // 디바운스: 입력 후 500ms 후에 중복 확인
    _debounce?.cancel();
    if (value.length >= 2) {
      _debounce = Timer(const Duration(milliseconds: 500), () {
        notifier.checkNickname();
      });
    }
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
          onPressed: () => context.go(RoutePaths.onboardingGender),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 진행 표시기
              const StepIndicator(currentStep: OnboardingStep.nickname),
              SizedBox(height: 32.h),

              // 타이틀
              Text(
                '닉네임을\n설정해주세요',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.gray900,
                  height: 1.3,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                '다른 사용자에게 표시되는 이름입니다.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.gray600,
                ),
              ),
              SizedBox(height: 48.h),

              // 닉네임 입력 필드
              TextField(
                controller: _controller,
                focusNode: _focusNode,
                onChanged: (value) => _onNicknameChanged(value, notifier),
                maxLength: 20,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.gray900,
                ),
                decoration: InputDecoration(
                  hintText: '닉네임 입력 (2-20자)',
                  hintStyle: TextStyle(
                    color: AppColors.gray400,
                    fontSize: 16.sp,
                  ),
                  filled: true,
                  fillColor: AppColors.gray100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: _getBorderColor(state),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: _getBorderColor(state),
                      width: 2,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(16.w),
                  counterText: '',
                  suffixIcon: _buildSuffixIcon(state),
                ),
              ),
              SizedBox(height: 8.h),

              // 상태 메시지
              _buildStatusMessage(state),

              SizedBox(height: 16.h),

              // 닉네임 규칙 안내
              _NicknameRules(),

              const Spacer(),

              // 완료 버튼
              OnboardingButton(
                text: '완료',
                isLoading: state.isLoading,
                onPressed: notifier.canSubmitNickname
                    ? () async {
                        final success = await notifier.submitProfile();
                        if (success && context.mounted) {
                          context.go(RoutePaths.home);
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

  Color _getBorderColor(OnboardingState state) {
    if (state.nicknameAvailable == true) {
      return AppColors.success;
    } else if (state.nicknameAvailable == false) {
      return AppColors.error;
    }
    return AppColors.gray200;
  }

  Widget? _buildSuffixIcon(OnboardingState state) {
    if (state.isLoading) {
      return Padding(
        padding: EdgeInsets.all(12.w),
        child: SizedBox(
          width: 20.w,
          height: 20.h,
          child: const CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.primary,
          ),
        ),
      );
    }

    if (state.nicknameAvailable == true) {
      return Icon(
        Icons.check_circle,
        color: AppColors.success,
        size: 24.w,
      );
    }

    if (state.nicknameAvailable == false) {
      return Icon(
        Icons.error,
        color: AppColors.error,
        size: 24.w,
      );
    }

    return null;
  }

  Widget _buildStatusMessage(OnboardingState state) {
    if (state.nicknameAvailable == true) {
      return Text(
        '사용 가능한 닉네임입니다.',
        style: TextStyle(
          fontSize: 13.sp,
          color: AppColors.success,
        ),
      );
    }

    if (state.errorMessage != null) {
      return Text(
        state.errorMessage!,
        style: TextStyle(
          fontSize: 13.sp,
          color: AppColors.error,
        ),
      );
    }

    return const SizedBox.shrink();
  }
}

/// 닉네임 규칙 안내
class _NicknameRules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.gray50,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '닉네임 규칙',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.gray700,
            ),
          ),
          SizedBox(height: 8.h),
          _RuleItem(text: '2~20자 이내'),
          _RuleItem(text: '한글, 영문, 숫자 사용 가능'),
          _RuleItem(text: '특수문자 사용 불가'),
          _RuleItem(text: '공백 사용 불가'),
        ],
      ),
    );
  }
}

class _RuleItem extends StatelessWidget {
  final String text;

  const _RuleItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: Row(
        children: [
          Icon(
            Icons.check,
            size: 14.w,
            color: AppColors.gray500,
          ),
          SizedBox(width: 6.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.gray600,
            ),
          ),
        ],
      ),
    );
  }
}
