# 00. Mapsy 빠른 참조 가이드

**문서 버전**: v1.0
**마지막 업데이트**: 2026-01-20
**목적**: 개발자가 3초 내에 필요한 정보를 찾을 수 있는 빠른 참조 치트시트

---

## 📑 목차

1. [🚀 빠른 시작 (30초 체크리스트)](#-빠른-시작-30초-체크리스트)
2. [📋 명령어 모음](#-명령어-모음)
3. [🗂️ 파일/폴더 네이밍](#️-파일폴더-네이밍)
4. [🔧 Riverpod Provider 템플릿](#-riverpod-provider-템플릿)
5. [🎨 디자인 시스템](#-디자인-시스템)
6. [🌐 API 엔드포인트](#-api-엔드포인트)
7. [🛠️ 기술 스택 버전](#️-기술-스택-버전)
8. [⚠️ 에러 해결 빠른 참조](#️-에러-해결-빠른-참조)
9. [📚 관련 문서](#-관련-문서)

---

## 🚀 빠른 시작 (30초 체크리스트)

### 새 Feature 추가하기

```bash
# 1. 폴더 생성
mkdir -p lib/features/{feature_name}/presentation/providers

# 2. Provider 파일 생성
touch lib/features/{feature_name}/presentation/providers/{feature_name}_provider.dart

# 3. Provider 작성 (아래 템플릿 복사)
# → StreamProvider / NotifierProvider / FutureProvider 선택

# 4. 코드 생성
flutter pub run build_runner build --delete-conflicting-outputs

# 5. 사용
# ref.watch({feature_name}Provider)
```

**체크리스트**:

- [ ] 폴더 생성: `lib/features/{feature}/presentation/providers/`
- [ ] Provider 파일: `{feature}_provider.dart`
- [ ] part 선언: `part '{feature}_provider.g.dart';`
- [ ] Provider 작성: [템플릿](#-riverpod-provider-템플릿) 복사
- [ ] 코드 생성: `flutter pub run build_runner build --delete-conflicting-outputs`
- [ ] 사용: `ref.watch({feature}Provider)`

---

## 📋 명령어 모음

### build_runner (코드 생성)

```bash
# 한 번 생성
flutter pub run build_runner build --delete-conflicting-outputs

# 감시 모드 (파일 저장 시 자동 생성)
flutter pub run build_runner watch --delete-conflicting-outputs

# 전체 재생성 (에러 발생 시)
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

**Makefile 사용** (프로젝트에 `Makefile` 있는 경우):

```bash
make gen     # 코드 생성
make watch   # 감시 모드
make clean   # 전체 재생성
```

---

### Flutter 실행 & 빌드

```bash
# 디버그 모드 실행
flutter run

# 특정 디바이스 선택
flutter devices                    # 연결된 디바이스 목록
flutter run -d {device_id}         # 특정 디바이스에서 실행

# 프로덕션 빌드
flutter build apk --release        # Android APK
flutter build appbundle --release  # Android App Bundle (PlayStore 업로드용)
flutter build ios --release        # iOS (Xcode 필요)

# 클린 빌드
flutter clean
flutter pub get
flutter run
```

---

### Git 워크플로우

```bash
# 브랜치 생성
git checkout -b feature/{feature-name}

# 변경사항 확인
git status
git diff

# 스테이징 & 커밋
git add .
git commit -m "feat: {기능명} 구현"

# 푸시
git push origin feature/{feature-name}

# 브랜치 삭제 (머지 후)
git branch -d feature/{feature-name}
git push origin --delete feature/{feature-name}
```

**커밋 메시지 컨벤션**:

- `feat:` - 새 기능
- `fix:` - 버그 수정
- `docs:` - 문서 변경
- `refactor:` - 리팩토링
- `test:` - 테스트 추가/수정
- `chore:` - 빌드, 설정 변경

---

### 패키지 관리

```bash
# 의존성 설치
flutter pub get

# 의존성 업데이트
flutter pub upgrade

# 캐시 삭제
flutter pub cache clean
```

---

## 🗂️ 파일/폴더 네이밍

### 파일명 규칙 (snake_case)

| 타입                     | 네이밍 규칙                   | 예시                            | 위치                      |
| ------------------------ | ----------------------------- | ------------------------------- | ------------------------- |
| **Page**                 | `{name}_page.dart`            | `login_page.dart`               | `presentation/pages/`     |
| **Provider**             | `{feature}_provider.dart`     | `auth_provider.dart`            | `presentation/providers/` |
| **Widget**               | `{name}_widget.dart`          | `login_button.dart`             | `presentation/widgets/`   |
| **Model**                | `{name}_model.dart`           | `user_model.dart`               | `data/models/`            |
| **Entity**               | `{name}.dart`                 | `user.dart`                     | `domain/entities/`        |
| **Repository Interface** | `{name}_repository.dart`      | `auth_repository.dart`          | `domain/repositories/`    |
| **Repository Impl**      | `{name}_repository_impl.dart` | `auth_repository_impl.dart`     | `data/repositories/`      |
| **DataSource**           | `{name}_datasource.dart`      | `firebase_auth_datasource.dart` | `data/datasources/`       |

---

### 폴더 구조 (Clean Architecture)

```
lib/features/{feature}/
│
├── data/                          # Data Layer
│   ├── datasources/               # API, Firebase 등 직접 호출
│   ├── models/                    # DTO (JSON 직렬화)
│   └── repositories/              # Repository 구현체
│
├── domain/                        # Domain Layer
│   ├── entities/                  # 순수 비즈니스 모델
│   └── repositories/              # Repository 인터페이스 (추상)
│
└── presentation/                  # Presentation Layer
    ├── pages/                     # 화면 (Page)
    ├── providers/                 # Riverpod Provider (상태 관리)
    └── widgets/                   # 재사용 위젯
```

**주요 Feature 모듈**:

- `lib/features/auth/` - 인증 (로그인, 회원가입)
- `lib/features/home/` - 홈 피드
- `lib/features/bookmark/` - 북마크 관리
- `lib/features/place/` - 장소 상세
- `lib/features/ai_extraction/` - AI 장소 추출

**상세**: [02_FOLDER_STRUCTURE.md](./02_FOLDER_STRUCTURE.md)

---

## 🔧 Riverpod Provider 템플릿

### StreamProvider (실시간 데이터)

```dart
// lib/features/{feature}/presentation/providers/{feature}_provider.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';

part '{feature}_provider.g.dart';

/// {설명}
@riverpod
Stream<DataType> {functionName}(Ref ref) {
  final repository = ref.watch({repository}Provider);
  return repository.{streamMethod}();
}
```

**사용 예시**:

```dart
// 자동 생성: {functionName}Provider
final authState = ref.watch(authStateProvider);

authState.when(
  data: (user) => Text('로그인됨: ${user.name}'),
  loading: () => CircularProgressIndicator(),
  error: (error, stack) => Text('에러: $error'),
);
```

---

### NotifierProvider (복잡한 상태 관리)

```dart
@riverpod
class {ClassName}Notifier extends _${ClassName}Notifier {
  @override
  FutureOr<DataType> build() {
    // 초기 상태 반환
    final repository = ref.watch({repository}Provider);
    return repository.{initialDataMethod}();
  }

  /// 액션 메서드
  Future<void> {actionName}() async {
    state = const AsyncValue.loading();

    try {
      final repository = ref.read({repository}Provider);
      final result = await repository.{method}();
      state = AsyncValue.data(result);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
```

**사용 예시**:

```dart
// 자동 생성: {className}NotifierProvider
final authNotifier = ref.watch(authNotifierProvider);

// 액션 실행
ref.read(authNotifierProvider.notifier).signInWithGoogle();
```

---

### FutureProvider (일회성 비동기 데이터)

```dart
@riverpod
Future<DataType> {functionName}(Ref ref) async {
  final repository = ref.watch({repository}Provider);
  return repository.{method}();
}
```

**사용 예시**:

```dart
final popularPlaces = ref.watch(popularPlacesProvider);

popularPlaces.when(
  data: (places) => ListView(children: places.map((p) => PlaceCard(p)).toList()),
  loading: () => CircularProgressIndicator(),
  error: (error, stack) => ErrorWidget(error),
);
```

---

### Family Provider (매개변수 있는 Provider)

```dart
@riverpod
Future<DataType> {functionName}(Ref ref, String id) async {
  final repository = ref.watch({repository}Provider);
  return repository.{method}(id);
}
```

**사용 예시**:

```dart
// 매개변수 전달
final placeDetail = ref.watch(placeDetailProvider('place-id-123'));
```

**상세**: [04_CODE_GENERATION_GUIDE.md](./04_CODE_GENERATION_GUIDE.md)

---

## 🎨 디자인 시스템

**상세 내용**: [Mapsy\_통합\_PRD_v1.0.md > 2.6 디자인 시스템](./Mapsy_통합_PRD_v1.0.md#26-디자인-시스템)

### 빠른 참조 (핵심만)

#### 컬러

```dart
import 'package:mapsy/core/constants/app_colors.dart';

AppColors.primary500          // 주요 액션 (0xFFFF6B6B)
AppColors.secondary500        // 보조 액션 (0xFF4ECDC4)
AppColors.accent500           // 강조 (0xFFFFD93D)
AppColors.backgroundPrimary   // 배경 (0xFFFFFFFF)
AppColors.textPrimary         // 텍스트 (0xFF212529)
```

#### 타이포그래피

```dart
import 'package:mapsy/core/constants/text_styles.dart';

AppTextStyles.h1          // 28px, Bold
AppTextStyles.body1       // 16px, Regular
AppTextStyles.buttonLarge // 16px, SemiBold
```

#### 간격 & 패딩

```dart
import 'package:mapsy/core/constants/spacing_and_radius.dart';

AppPadding.all16          // EdgeInsets.all(16.r)
AppSpacing.vertical16     // 16.0.h
AppRadius.radius12        // BorderRadius.circular(12.r)
```

---

## 🌐 API 엔드포인트

### 인증 API

```
POST   /api/auth/sign-in          Firebase OAuth 로그인
POST   /api/auth/reissue           JWT 토큰 갱신
POST   /api/auth/logout            로그아웃
DELETE /api/auth/withdraw          회원 탈퇴
```

---

### 회원 관리 API

```
POST /api/members/onboarding/terms        약관 동의
POST /api/members/onboarding/birth-date   생년월일 입력
POST /api/members/onboarding/gender       성별 선택
POST /api/members/profile                 프로필 수정
GET  /api/members/check-name              닉네임 중복 검사
GET  /api/members/{memberId}              회원 정보 조회
```

---

### 피드 API

```
GET /api/feed/latest/cursor       최신 장소 피드 (Cursor 페이지네이션)
    ?cursor=null&size=20

GET /api/feed/popular             인기 장소 피드 (가중치 알고리즘)
    ?size=30

GET /api/feed/my-top-places       내 저장 장소 TOP
    ?limit=10

GET /api/feed/trending-keywords   트렌드 키워드
    ?limit=20&days=7
```

---

### 키워드 API

```
GET /api/keywords/{keyword}         키워드 상세 정보
GET /api/keywords/{keyword}/places  키워드별 장소 목록
```

---

### 장소 관리 API

```
GET    /api/place/{placeId}              장소 상세 정보
GET    /api/place/temporary              임시 저장 장소
POST   /api/place/{placeId}/save         장소 저장
DELETE /api/place/{placeId}/temporary    임시 저장 삭제
```

---

### 북마크 API

```
GET   /api/bookmarks                저장 장소 목록 (Offset 페이지네이션)
      ?folder={folderId}&page=0&size=20&sort=createdAt,DESC

GET   /api/bookmarks/cursor         저장 장소 목록 (Cursor 페이지네이션)
      ?cursor=null&size=20

GET   /api/bookmarks/folders        폴더 목록

PATCH /api/bookmarks/{bookmarkId}   북마크 정보 수정
      { memo: "...", rating: 5, visitedAt: "2026-01-20" }

DELETE /api/bookmarks/{bookmarkId}  북마크 삭제 (Soft Delete)
```

---

### 콘텐츠/AI 추출 API

```
POST /api/content/analyze           SNS URL 장소 추출 요청
     { url: "https://instagram.com/...", platform: "INSTAGRAM" }
     → Response: { contentId: "uuid", status: "PENDING" }

GET  /api/content/{contentId}       콘텐츠 정보 조회 (폴링용, 2초 간격)
     → Response: { status: "PROCESSING" | "COMPLETED" | "FAILED", places: [...] }

GET  /api/content/member            내 콘텐츠 목록
```

---

## 🛠️ 기술 스택 버전

### 핵심 프레임워크

```yaml
Flutter SDK: ^3.9.2
Dart: 3.0+

# 플랫폼
iOS: 13.0+
Android: API 24+ (Android 7.0)
```

---

### 상태 관리 (Riverpod)

```yaml
flutter_riverpod: ^2.6.1
riverpod_annotation: ^2.6.1
riverpod_generator: ^2.6.2
```

---

### 네트워크 & API

```yaml
dio: ^5.9.0
retrofit: ^4.7.2
retrofit_generator: ^9.1.8
```

---

### 코드 생성

```yaml
build_runner: ^2.4.14
freezed: ^2.5.7
freezed_annotation: ^2.4.4
json_serializable: ^6.9.2
json_annotation: ^4.9.0
```

---

### 라우팅 & 네비게이션

```yaml
go_router: ^17.0.1
```

---

### Firebase

```yaml
firebase_core: ^3.8.1
firebase_auth: ^6.1.3
firebase_messaging: ^16.0.1
firebase_crashlytics: ^4.3.1
```

---

### 소셜 로그인

```yaml
google_sign_in: ^6.2.3
sign_in_with_apple: ^6.1.3
```

---

### UI & 디자인

```yaml
flutter_screenutil: ^5.9.3 # 반응형 디자인
lottie: ^3.2.1 # 애니메이션
cached_network_image: ^3.4.1 # 이미지 캐싱
flutter_svg: ^2.2.1 # SVG
smooth_page_indicator: ^1.2.1 # 페이지 인디케이터
```

---

### 보안 & 저장소

```yaml
flutter_secure_storage: ^9.2.2
```

---

## ⚠️ 에러 해결 빠른 참조

### 자주 발생하는 에러 & 1줄 해결법

| 에러 메시지                              | 해결법                                                            |
| ---------------------------------------- | ----------------------------------------------------------------- |
| `part 'xxx.g.dart' not found`            | `flutter pub run build_runner build --delete-conflicting-outputs` |
| `Conflicting outputs were detected`      | `--delete-conflicting-outputs` 플래그 추가                        |
| `Provider not found` (Undefined name)    | `*.g.dart` 생성 확인, `part` 선언 확인                            |
| `Build failed: Bad UTF-8 encoding`       | 파일 인코딩을 UTF-8로 변경 (VS Code 우측 하단)                    |
| `Missing fromJson factory`               | Freezed 모델에 `factory {Model}.fromJson()` 추가                  |
| `The return type ... cannot be assigned` | NotifierProvider의 `build()` 반환 타입을 `FutureOr<T>`로 변경     |

---

### 코드 생성 관련

**문제**: `*.g.dart` 파일이 생성되지 않음

**해결 체크리스트**:

1. `part '{파일명}.g.dart';` 선언 확인
2. `@riverpod` / `@freezed` 어노테이션 확인
3. `flutter pub run build_runner build --delete-conflicting-outputs` 실행
4. 에러 메시지 확인 (터미널 출력)

---

### Provider 사용 관련

**문제**: `ref.watch({provider}Provider)` 시 `Provider not found`

**해결**:

1. `*.g.dart` 파일 생성 확인
2. import 경로 확인 (`.g.dart`는 자동 포함되므로 별도 import 불필요)
3. Provider 이름 확인 (함수명 + `Provider` 접미사)

---

### Firebase 인증 관련

**문제**: Google 로그인 실패

**해결**:

1. Firebase Console에서 Google 로그인 활성화 확인
2. Android: `google-services.json` 파일 배치 확인 (`android/app/`)
3. iOS: `GoogleService-Info.plist` 파일 배치 확인 (`ios/Runner/`)
4. SHA-1 인증서 등록 확인 (Firebase Console)

---

### 빌드 에러 관련

**문제**: `flutter run` 실패

**해결**:

```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

**상세**: [04_CODE_GENERATION_GUIDE.md > 6. 자주 발생하는 에러](./04_CODE_GENERATION_GUIDE.md#6-자주-발생하는-에러)

---

## 📚 관련 문서

### 상세 문서 링크

| 문서                                                             | 내용                                                          | 언제 보기                           |
| ---------------------------------------------------------------- | ------------------------------------------------------------- | ----------------------------------- |
| **[01_ARCHITECTURE.md](./01_ARCHITECTURE.md)**                   | 시스템 아키텍처, 기술 스택, Clean Architecture, 데이터 플로우 | 전체 아키텍처 이해 필요할 때        |
| **[02_FOLDER_STRUCTURE.md](./02_FOLDER_STRUCTURE.md)**           | Flutter 프로젝트 폴더 구조, features/ 모듈 상세               | 파일 배치 위치 확인할 때            |
| **[04_CODE_GENERATION_GUIDE.md](./04_CODE_GENERATION_GUIDE.md)** | Riverpod/Freezed/Retrofit 코드 생성 가이드                    | Provider 작성법 상세히 알고 싶을 때 |
| **[Mapsy\_통합\_PRD_v1.0.md](./Mapsy_통합_PRD_v1.0.md)**         | 전체 PRD 원본 (비즈니스 로직, 화면 설계)                      | 비즈니스 로직 플로우 확인할 때      |

---

### 검색 팁

**목적별 문서 선택**:

- ❓ "Riverpod Provider 어떻게 만들지?" → **이 문서 (00번)** [템플릿](#-riverpod-provider-템플릿) 복사
- ❓ "Provider 에러 해결" → **이 문서 (00번)** [에러 해결](#️-에러-해결-빠른-참조) 확인
- ❓ "폴더 어디에 만들지?" → **이 문서 (00번)** [파일/폴더 네이밍](#️-파일폴더-네이밍) 확인
- ❓ "Clean Architecture 레이어 구조" → **01_ARCHITECTURE.md**
- ❓ "features/auth/ 폴더 구조 상세" → **02_FOLDER_STRUCTURE.md**
- ❓ "Freezed 사용법 상세" → **04_CODE_GENERATION_GUIDE.md**
- ❓ "AI 추출 플로우 비즈니스 로직" → **Mapsy\_통합\_PRD_v1.0.md**

---

## 💡 추가 팁

### VS Code 단축키

```
Ctrl/Cmd + P          파일 빠른 열기
Ctrl/Cmd + Shift + P  명령 팔레트
Ctrl/Cmd + Space      자동 완성
F2                    이름 변경 (리팩토링)
Shift + Alt + F       코드 포맷팅
```

---

### Flutter DevTools

```bash
# DevTools 실행
flutter pub global activate devtools
flutter pub global run devtools
```

**기능**:

- Widget 트리 검사
- 성능 프로파일링
- 네트워크 요청 모니터링
- Riverpod Provider 상태 확인

---

### 유용한 확장 프로그램 (VS Code)

- **Flutter**: Flutter 개발 필수
- **Dart**: Dart 언어 지원
- **Flutter Riverpod Snippets**: Riverpod 코드 스니펫
- **Better Comments**: 주석 하이라이팅
- **Error Lens**: 인라인 에러 표시

---

**문서 끝**

---

## 📝 변경 이력

| 버전 | 날짜       | 변경 내용      |
| ---- | ---------- | -------------- |
| v1.0 | 2026-01-20 | 초기 버전 작성 |
