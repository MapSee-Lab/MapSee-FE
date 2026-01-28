// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'59e14cd015af5ec5163321683e8232da6291ca1b';

/// Dio 인스턴스 Provider
///
/// 앱 전체에서 사용하는 HTTP 클라이언트입니다.
/// 인증, 토큰 갱신, 에러 변환 인터셉터가 자동으로 적용됩니다.
///
/// **사용법**:
/// ```dart
/// final dio = ref.watch(dioProvider);
/// final response = await dio.get('/api/some-endpoint');
/// ```
///
/// Copied from [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$refreshDioHash() => r'4e4a3a496c4b824d722ceb8ea9ed618351f0e92c';

/// 토큰 갱신 전용 Dio 인스턴스
///
/// TokenRefreshInterceptor에서 사용하는 별도의 Dio 인스턴스입니다.
/// 인터셉터 순환을 방지하기 위해 최소한의 설정만 적용합니다.
///
/// Copied from [refreshDio].
@ProviderFor(refreshDio)
final refreshDioProvider = AutoDisposeProvider<Dio>.internal(
  refreshDio,
  name: r'refreshDioProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$refreshDioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RefreshDioRef = AutoDisposeProviderRef<Dio>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
