import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../router/route_paths.dart';
import '../providers/onboarding_provider.dart';
import '../widgets/onboarding_button.dart';
import '../widgets/step_indicator.dart';

/// 약관 동의 화면
class TermsStepPage extends ConsumerWidget {
  const TermsStepPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingNotifierProvider);
    final notifier = ref.read(onboardingNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 진행 표시기
              const StepIndicator(currentStep: OnboardingStep.terms),
              SizedBox(height: 32.h),

              // 타이틀
              Text(
                '서비스 이용을 위해\n약관에 동의해주세요',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.gray900,
                  height: 1.3,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                '원활한 서비스 이용을 위해 필수 약관에 동의가 필요합니다.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.gray600,
                ),
              ),
              SizedBox(height: 32.h),

              // 전체 동의
              _AllAgreeItem(
                isChecked: state.serviceAgreed && state.privacyAgreed && state.marketingAgreed,
                onTap: notifier.agreeAll,
              ),
              SizedBox(height: 16.h),
              const Divider(color: AppColors.gray200),
              SizedBox(height: 16.h),

              // 개별 약관
              _AgreementItem(
                title: '[필수] 서비스 이용약관',
                isChecked: state.serviceAgreed,
                onTap: notifier.toggleServiceAgreement,
                onDetailTap: () => _showTermsDetail(context, '서비스 이용약관'),
              ),
              SizedBox(height: 12.h),
              _AgreementItem(
                title: '[필수] 개인정보 처리방침',
                isChecked: state.privacyAgreed,
                onTap: notifier.togglePrivacyAgreement,
                onDetailTap: () => _showTermsDetail(context, '개인정보 처리방침'),
              ),
              SizedBox(height: 12.h),
              _AgreementItem(
                title: '[선택] 마케팅 정보 수신 동의',
                isChecked: state.marketingAgreed,
                onTap: notifier.toggleMarketingAgreement,
                onDetailTap: () => _showTermsDetail(context, '마케팅 정보 수신'),
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
                text: '동의하고 계속하기',
                isLoading: state.isLoading,
                onPressed: notifier.canSubmitTerms
                    ? () async {
                        final success = await notifier.submitTerms();
                        if (success && context.mounted) {
                          context.go(RoutePaths.onboardingBirthDate);
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

  void _showTermsDetail(BuildContext context, String title) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Text(
                    _getTermsContent(title),
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.gray700,
                      height: 1.6,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getTermsContent(String title) {
    // TODO: 실제 약관 내용으로 교체
    return '''
$title

제1조 (목적)
이 약관은 MapSy(이하 "회사")가 제공하는 서비스의 이용조건 및 절차, 회사와 회원 간의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.

제2조 (정의)
1. "서비스"라 함은 회사가 제공하는 모든 서비스를 의미합니다.
2. "회원"이라 함은 회사와 서비스 이용계약을 체결하고 회사가 제공하는 서비스를 이용하는 자를 말합니다.

제3조 (약관의 효력 및 변경)
1. 이 약관은 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력이 발생합니다.
2. 회사는 합리적인 사유가 발생한 경우 관련 법령에 위배되지 않는 범위 내에서 약관을 변경할 수 있습니다.

(이하 생략...)
''';
  }
}

/// 전체 동의 아이템
class _AllAgreeItem extends StatelessWidget {
  final bool isChecked;
  final VoidCallback onTap;

  const _AllAgreeItem({
    required this.isChecked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isChecked ? AppColors.primary.withValues(alpha: 0.1) : AppColors.gray100,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isChecked ? AppColors.primary : AppColors.gray200,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isChecked ? Icons.check_circle : Icons.check_circle_outline,
              color: isChecked ? AppColors.primary : AppColors.gray400,
              size: 24.w,
            ),
            SizedBox(width: 12.w),
            Text(
              '전체 동의하기',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.gray900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 개별 약관 아이템
class _AgreementItem extends StatelessWidget {
  final String title;
  final bool isChecked;
  final VoidCallback onTap;
  final VoidCallback onDetailTap;

  const _AgreementItem({
    required this.title,
    required this.isChecked,
    required this.onTap,
    required this.onDetailTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(4.r),
          child: Row(
            children: [
              Icon(
                isChecked ? Icons.check_circle : Icons.check_circle_outline,
                color: isChecked ? AppColors.primary : AppColors.gray400,
                size: 22.w,
              ),
              SizedBox(width: 8.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: AppColors.gray700,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: onDetailTap,
          child: Icon(
            Icons.chevron_right,
            color: AppColors.gray400,
            size: 20.w,
          ),
        ),
      ],
    );
  }
}
