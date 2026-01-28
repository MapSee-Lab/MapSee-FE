import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/spacing_and_radius.dart';
import '../core/constants/text_styles.dart';
import 'route_paths.dart';

// Auth Provider Import
import '../features/auth/presentation/providers/auth_provider.dart';

// Page Imports
import '../features/auth/presentation/pages/splash_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/onboarding_page.dart';
import '../features/home/presentation/pages/home_page.dart';

// Onboarding Step Pages
import '../features/onboarding/presentation/pages/terms_step_page.dart';
import '../features/onboarding/presentation/pages/birth_date_step_page.dart';
import '../features/onboarding/presentation/pages/gender_step_page.dart';
import '../features/onboarding/presentation/pages/nickname_step_page.dart';

// Token Storage for onboarding state
import '../core/network/token_storage.dart';

/// GoRouter 인스턴스를 제공하는 Riverpod Provider
///
/// 앱 전체의 네비게이션을 관리하며, 인증 상태에 따라
/// 자동으로 리다이렉트를 수행합니다.
///
/// 사용법:
/// ```dart
/// // 1. main.dart에서 MaterialApp.router에 연결
/// final router = ref.watch(routerProvider);
/// return MaterialApp.router(
///   routerConfig: router,
/// );
///
/// // 2. 페이지에서 네비게이션 사용
/// // 경로로 이동
/// context.go(RoutePaths.home);              // 현재 페이지 대체
/// context.push(RoutePaths.login);           // 새 페이지 추가
///
/// // 이름으로 이동
/// context.goNamed(RoutePaths.homeName);
/// context.pushNamed(RoutePaths.loginName);
///
/// // 뒤로가기
/// context.pop();                            // 이전 페이지로
/// context.pop(result);                      // 결과값과 함께 돌아가기
///
/// // 3. 라우팅 가드 (자동 리다이렉트)
/// // - 비로그인 시 → 로그인 페이지로
/// // - 인증된 사용자가 로그인 페이지 접근 → 홈으로
/// ```
///
/// 주요 기능:
/// - 선언적 라우팅: routes 리스트로 모든 경로 정의
/// - 자동 리다이렉트: redirect 함수로 접근 제어
/// - Deep Link 지원: URL로 직접 특정 페이지 접근
/// - 404 에러 처리: errorBuilder로 잘못된 경로 처리
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RoutePaths.splash,
    debugLogDiagnostics: true, // 개발 중 라우팅 로그 확인
    // refreshListenable 활성화 (auth 상태 변경 감지)
    refreshListenable: _GoRouterRefreshNotifier(ref, authStateProvider),
    redirect: (BuildContext context, GoRouterState state) {
      // ====================================================================
      // 실제 Provider에서 인증 상태 가져오기
      // ====================================================================
      final authUser = ref.read(authStateProvider).value;
      final isAuthenticated = authUser != null;

      final currentPath = state.uri.path;

      // 인증이 불필요한 공개 경로 (Splash, Login)
      final publicPaths = [RoutePaths.splash, RoutePaths.login];

      // 온보딩 경로들
      final onboardingPaths = [
        RoutePaths.onboarding,
        RoutePaths.onboardingTerms,
        RoutePaths.onboardingBirthDate,
        RoutePaths.onboardingGender,
        RoutePaths.onboardingNickname,
      ];

      // ====================================================================
      // 1. 인증 체크 - 로그인 필요한 페이지 보호
      // ====================================================================
      if (!isAuthenticated) {
        // 스플래시와 로그인 페이지는 허용
        if (publicPaths.contains(currentPath)) {
          return null;
        }
        // 그 외 모든 페이지는 로그인으로 리다이렉트
        return RoutePaths.login;
      }

      // ====================================================================
      // 2. 인증된 사용자가 로그인 페이지 접근 시 → 홈 또는 온보딩으로
      // ====================================================================
      if (currentPath == RoutePaths.login) {
        // 온보딩 필요 여부 확인 (동기적으로 확인 불가하므로 일단 홈으로)
        // 실제 온보딩 체크는 로그인 후 SignInResponse에서 처리
        return RoutePaths.home;
      }

      // ====================================================================
      // 3. 온보딩 중인 사용자가 홈에 접근 시 → 온보딩으로 리다이렉트
      // ====================================================================
      // 온보딩 경로에 있으면 허용
      if (onboardingPaths.contains(currentPath)) {
        return null;
      }

      return null; // 리다이렉트 불필요
    },

    routes: [
      // ====================================================================
      // Root & Authentication Routes
      // ====================================================================
      GoRoute(
        path: RoutePaths.splash,
        name: RoutePaths.splashName,
        builder: (context, state) => const SplashPage(),
      ),

      GoRoute(
        path: RoutePaths.login,
        name: RoutePaths.loginName,
        builder: (context, state) => const LoginPage(),
      ),

      GoRoute(
        path: RoutePaths.onboarding,
        name: RoutePaths.onboardingName,
        builder: (context, state) => const OnboardingPage(),
      ),

      // ====================================================================
      // Onboarding Step Routes
      // ====================================================================
      GoRoute(
        path: RoutePaths.onboardingTerms,
        name: RoutePaths.onboardingTermsName,
        builder: (context, state) => const TermsStepPage(),
      ),

      GoRoute(
        path: RoutePaths.onboardingBirthDate,
        name: RoutePaths.onboardingBirthDateName,
        builder: (context, state) => const BirthDateStepPage(),
      ),

      GoRoute(
        path: RoutePaths.onboardingGender,
        name: RoutePaths.onboardingGenderName,
        builder: (context, state) => const GenderStepPage(),
      ),

      GoRoute(
        path: RoutePaths.onboardingNickname,
        name: RoutePaths.onboardingNicknameName,
        builder: (context, state) => const NicknameStepPage(),
      ),

      // ====================================================================
      // Home & Main Navigation
      // ====================================================================
      GoRoute(
        path: RoutePaths.home,
        name: RoutePaths.homeName,
        builder: (context, state) => const HomePage(),
      ),
    ],

    // ====================================================================
    // Error Handling (404 Page)
    // ====================================================================
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: Text('페이지를 찾을 수 없습니다', style: AppTextStyles.label)),
      body: Center(
        child: Padding(
          padding: AppPadding.all20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              SizedBox(height: AppSpacing.vertical16),
              Text('요청하신 페이지가 존재하지 않습니다.', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.vertical8),
              Text(
                '경로: ${state.uri.path}',
                style: AppTextStyles.callout.copyWith(color: Colors.grey),
              ),
              SizedBox(height: AppSpacing.vertical24),
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.home),
                child: Text('홈으로 돌아가기', style: AppTextStyles.paragraph),
              ),
            ],
          ),
        ),
      ),
    ),
  );
});

// ============================================================================
// GoRouter용 Refresh Notifier (StreamProvider 감지용)
// ============================================================================

/// GoRouter용 Refresh Notifier
///
/// StreamProvider의 상태 변경을 감지하여 GoRouter에게
/// 리다이렉트 재실행을 트리거합니다.
class _GoRouterRefreshNotifier extends ChangeNotifier {
  _GoRouterRefreshNotifier(this._ref, this._provider) {
    _ref.listen<AsyncValue<dynamic>>(_provider, (previous, next) {
      notifyListeners(); // 상태 변경 시 GoRouter에 알림
    });
  }

  final Ref _ref;
  final ProviderListenable<AsyncValue<dynamic>> _provider;
}
