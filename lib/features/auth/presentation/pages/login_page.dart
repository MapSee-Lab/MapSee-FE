import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/spacing_and_radius.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/errors/app_exception.dart';
import '../../../../router/route_paths.dart';
import '../../data/models/sign_in_response.dart';
import '../providers/auth_provider.dart';

/// Google 로그인 화면
///
/// Google Sign-In을 통해 사용자 인증을 수행합니다.
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  /// Google 로그인 버튼 핸들러
  ///
  /// Google 로그인을 수행하고 에러 발생 시 SnackBar를 표시합니다.
  Future<void> _handleGoogleSignIn(BuildContext context, WidgetRef ref) async {
    // AuthNotifier로 로그인 수행 (백엔드 응답 포함)
    final signInResponse = await ref.read(authNotifierProvider.notifier).signInWithGoogle();

    // 에러 체크 및 SnackBar 표시
    if (!context.mounted) return;

    final authState = ref.read(authNotifierProvider);

    if (authState.hasError) {
      final errorMessage = authState.error is AuthException
          ? (authState.error as AuthException).message
          : '로그인 중 오류가 발생했습니다.';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage, style: AppTextStyles.toast),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }

    // 로그인 성공 시 온보딩 여부에 따라 리다이렉트
    if (signInResponse != null) {
      _navigateAfterLogin(context, signInResponse);
    }
  }

  /// Apple 로그인 버튼 핸들러
  ///
  /// Apple 로그인을 수행하고 에러 발생 시 SnackBar를 표시합니다.
  Future<void> _handleAppleSignIn(BuildContext context, WidgetRef ref) async {
    // AuthNotifier로 로그인 수행 (백엔드 응답 포함)
    final signInResponse = await ref.read(authNotifierProvider.notifier).signInWithApple();

    // 에러 체크 및 SnackBar 표시
    if (!context.mounted) return;

    final authState = ref.read(authNotifierProvider);

    if (authState.hasError) {
      final errorMessage = authState.error is AuthException
          ? (authState.error as AuthException).message
          : 'Apple 로그인 중 오류가 발생했습니다.';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage, style: AppTextStyles.toast),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }

    // 로그인 성공 시 온보딩 여부에 따라 리다이렉트
    if (signInResponse != null) {
      _navigateAfterLogin(context, signInResponse);
    }
  }

  /// 로그인 성공 후 네비게이션 처리
  ///
  /// 온보딩 필요 여부에 따라 적절한 화면으로 이동합니다.
  void _navigateAfterLogin(BuildContext context, SignInResponse response) {
    if (response.requiresOnboarding) {
      // 온보딩이 필요한 경우 현재 단계로 이동
      final step = OnboardingStep.fromString(response.onboardingStep);
      switch (step) {
        case OnboardingStep.terms:
          context.go(RoutePaths.onboardingTerms);
          break;
        case OnboardingStep.birthDate:
          context.go(RoutePaths.onboardingBirthDate);
          break;
        case OnboardingStep.gender:
          context.go(RoutePaths.onboardingGender);
          break;
        case OnboardingStep.nickname:
          context.go(RoutePaths.onboardingNickname);
          break;
        case OnboardingStep.completed:
          context.go(RoutePaths.home);
          break;
      }
    } else {
      // 온보딩이 완료된 경우 홈으로 이동
      context.go(RoutePaths.home);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Login', style: AppTextStyles.subHeading)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('로그인', style: AppTextStyles.heading01),
            SizedBox(height: AppSpacing.vertical40),

            // TODO: Google 로그인 버튼 디자인 만들어지면 바뀌어야함
            ElevatedButton.icon(
              onPressed: authState.isLoading
                  ? null // 로딩 중에는 버튼 비활성화
                  : () => _handleGoogleSignIn(context, ref),
              icon: const Icon(Icons.login),
              label: const Text('Google Login'),
              style: ElevatedButton.styleFrom(
                padding: AppPadding.buttonPadding,
                textStyle: AppTextStyles.label,
              ),
            ),

            // iOS에서만 Apple 로그인 버튼 표시
            if (Platform.isIOS) ...[
              SizedBox(height: AppSpacing.vertical16),
              // TODO: Apple 로그인 버튼 디자인 만들어지면 바뀌어야함
              ElevatedButton.icon(
                onPressed: authState.isLoading
                    ? null // 로딩 중에는 버튼 비활성화
                    : () => _handleAppleSignIn(context, ref),
                icon: const Icon(Icons.apple),
                label: const Text('Apple Login'),
                style: ElevatedButton.styleFrom(
                  padding: AppPadding.buttonPadding,
                  textStyle: AppTextStyles.label,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              ),
            ],

            // 로딩 인디케이터
            if (authState.isLoading)
              Padding(
                padding: EdgeInsets.only(top: AppSpacing.vertical20),
                child: const CircularProgressIndicator(),
              ),

            // 에러 메시지 (선택사항 - SnackBar와 중복이므로 간단하게 표시)
            if (authState.hasError && !authState.isLoading)
              Padding(
                padding: EdgeInsets.only(
                  top: AppSpacing.vertical20,
                  left: AppSpacing.horizontal20,
                  right: AppSpacing.horizontal20,
                ),
                child: Text(
                  authState.error is AuthException
                      ? (authState.error as AuthException).message
                      : '로그인에 실패했습니다.',
                  style: AppTextStyles.paragraph.copyWith(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
