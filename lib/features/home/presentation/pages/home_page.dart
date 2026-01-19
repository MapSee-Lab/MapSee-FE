import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../router/route_paths.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

/// 홈 화면
///
/// 인증 완료 후 진입하는 메인 화면입니다.
/// TODO: 실제 MapSy 기능 구현 필요
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MapSy'),
        actions: [
          // 로그아웃 버튼
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(authNotifierProvider.notifier).signOut();
              if (context.mounted) {
                context.go(RoutePaths.login);
              }
            },
            tooltip: '로그아웃',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.map,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 24),
            const Text(
              'MapSy 홈 화면',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            authState.when(
              data: (user) => Text(
                '환영합니다, ${user?.displayName ?? user?.email ?? "사용자"}님!',
                style: const TextStyle(fontSize: 16),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text(
                '사용자 정보를 불러올 수 없습니다',
                style: TextStyle(color: Colors.red[700]),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'TODO: 실제 기능 구현 필요',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
