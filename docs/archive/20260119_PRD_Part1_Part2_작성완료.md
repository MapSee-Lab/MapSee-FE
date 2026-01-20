# Mapsy PRD Part 1 + Part 2 작성 완료 보고서

**보고서 일자**: 2026-01-19
**문서 위치**: `C:\Users\USER\.claude\plans\misty-growing-wand.md`
**작성 범위**: Part 1 (Executive Summary) + Part 2 (Product Specifications)
**문서 버전**: v1.0

---

## 📌 작업 개요

Mapsy (맵시) 프로젝트의 **PRD (Product Requirements Document) Part 1 + Part 2** 작성 완료. SNS 콘텐츠에서 AI가 장소를 자동 추출하는 모바일 앱의 제품 요구사항을 50페이지 분량으로 정리.

### 프로젝트 비전
**"SNS 속 숨은 맛집과 핫플레이스를 AI가 찾아주는 스마트 장소 큐레이션 플랫폼"**

---

## 🎯 문서 작성 목표

1. **명확한 제품 비전 정의** - 문제 정의, 해결책, 타겟 사용자 명시
2. **기술 스택 및 아키텍처 문서화** - 3-tier 시스템 (Flutter + Spring Boot + FastAPI)
3. **상세한 기능 명세** - 6개 핵심 기능, 5개 Epic User Stories
4. **구현 가능한 API 설계** - 30+ 엔드포인트, Request/Response 예시 포함
5. **실행 가능한 로드맵** - 3 Phase 마일스톤 및 Next Steps

---

## ✅ 작성 완료 항목

### Part 1: Executive Summary (~15페이지)

#### 1.1 프로젝트 개요
- **비전**: AI 기반 SNS 장소 추출 플랫폼
- **핵심 문제**: 정보 파편화, 수동 작업 번거로움, 정보 손실, 중복 검색
- **해결책**: AI 자동 추출 + 스마트 북마크 + 트렌드 피드
- **타겟 사용자**: 20-30대 여성 (1차), 여행 계획자/커플 (2차), 인플루언서 (3차)

#### 1.2 핵심 기능 (6개)
1. **AI 장소 추출**: Instagram/YouTube → STT + OCR + LLM 분석 → 장소 정보
2. **홈 피드**: 최신 장소, 인기 피드 (가중치 알고리즘), 내 저장 TOP, 키워드 트렌드
3. **키워드/태그 피드**: 특정 키워드 필터링, 그리드뷰/리스트뷰 전환
4. **장소 상세 정보**: 주소, 영업시간, 평점, 지도, 출처 콘텐츠
5. **개인 북마크 관리**: 폴더 정리, 메모/별점/방문 기록
6. **소셜 기능**: 컬렉션 공유, 팔로우 (2차 MVP)

#### 1.3 시스템 아키텍처
```
Flutter App (Mobile)
    ↓ REST API
Spring Boot Backend (7 modules)
    ├─ PostgreSQL (Main DB)
    ├─ Redis (Cache + Session)
    └─ Firebase (OAuth + FCM)
    ↓ Webhook Callback
FastAPI AI Server (Python 3.13)
    ├─ yt-dlp (SNS 다운로드)
    ├─ Whisper (STT)
    ├─ Gemini 2.5 (LLM)
    └─ Kakao Maps (Geocoding)
```

**데이터 플로우**:
Instagram URL → AI 서버 비동기 처리 → LLM 장소 추출 → Webhook Callback → 임시 저장 → 사용자 확인 → 확정 저장

#### 1.4 주요 마일스톤

| Phase | 목표 | 예상 일정 | 상태 |
|-------|------|----------|------|
| **Phase 1: MVP** | 핵심 기능 구현 및 베타 테스트 | Week 1-12 | 🟡 진행 중 |
| - M1: Backend API 완성 | 인증, 피드, 페이지네이션 | Week 1-4 | 🟡 70% |
| - M2: AI 서버 안정화 | Instagram/YouTube 추출 90%+ | Week 2-5 | 🟡 60% |
| - M3: Flutter 앱 개발 | UI/UX, API 연동 | Week 3-8 | 🔴 미시작 |
| - M4: 베타 테스트 | 50명 사용자 피드백 | Week 9-10 | 🔴 미시작 |
| - M5: 1차 MVP 출시 | App Store/Play Store | Week 12 | 🔴 미시작 |
| **Phase 2: 확장** | 소셜 기능, TikTok/FB/Twitter | 출시 후 | 📅 계획됨 |
| **Phase 3: 수익화** | 프리미엄 구독, B2B API | 로드맵 | 📅 계획됨 |

---

### Part 2: Product Specifications (~35페이지)

#### 2.1 사용자 스토리 (5 Epics)

**Epic 1: AI 장소 추출**
- US-1.1: Instagram 릴스 URL → AI 장소 이름+주소 추출
- US-1.2: 임시 저장 목록 → 사용자 확인 → 확정 저장
- US-1.3: YouTube 영상 → STT → 장소 추출
- US-1.4: 추출 실패 시 수동 추가 옵션

**Acceptance Criteria**:
- Instagram 추출 성공률 85%+
- YouTube 추출 성공률 80%+
- 평균 처리 시간 30초 이내
- 좌표 정확도 95%+ (Kakao Geocoding)

**Epic 2: 홈 피드**
- US-2.1: 최신 추가 장소 무한 스크롤 (20개/페이지)
- US-2.2: 인기 피드 가중치 적용 (최근 7일 = 2배)
- US-2.3: 내 저장 장소 TOP (최대 10개)
- US-2.4: 트렌드 키워드 (7일 기준)

**Acceptance Criteria**:
- 무한 스크롤 지원
- 가중치 공식 적용
- 실시간 반영 (1분 이내)
- Redis 캐싱 (1시간 TTL)

**Epic 3: 키워드/태그 피드**
- US-3.1: 키워드 클릭 → 연관 장소 표시
- US-3.2: 필터 (최신순/인기순/거리순)
- US-3.3: 그리드뷰/리스트뷰 전환
- US-3.4: 키워드 상세 (게시물 수, 트렌드 상승률)

**Epic 4: 장소 상세 정보**
- US-4.1: 기본 정보 (주소, 카테고리, 평점)
- US-4.2: Google Places API 연동
- US-4.3: 관련 키워드 태그
- US-4.4: 출처 콘텐츠 링크 (최대 10개)
- US-4.5: 길찾기 (카카오맵/네이버맵/구글맵)

**Epic 5: 개인 북마크 관리**
- US-5.1: 임시 저장 → 확정 저장
- US-5.2: 폴더 선택 (가고 싶은 곳/가본 곳/커스텀)
- US-5.3: 메모, 별점, 방문 날짜 기록
- US-5.4: 필터/정렬 (폴더별/방문 여부/별점/최근순)
- US-5.5: Soft delete (30일 복구 가능)

#### 2.2 화면별 기능 명세 (6개 주요 화면)

**2.2.1 온보딩 화면**
- 스플래시 (2초)
- 온보딩 슬라이드 (3페이지)
- 로그인/회원가입 (Google/Apple OAuth)
- 초기 정보 입력 (생년월일/성별/닉네임)

**2.2.2 홈 화면 (피드)**
- 헤더: 로고 + 알림 아이콘
- 섹션 1: 최신 추가 장소 (카드형 무한 스크롤)
- 섹션 2: 인기 인스타 피드 (그리드 3열)
- 섹션 3: 내 저장 장소 TOP (가로 스크롤)
- 섹션 4: 떠오르는 키워드 (태그 칩)
- FAB: URL 추가 버튼

**2.2.3 AI 추출 화면**
- URL 입력 바텀 시트
- 처리 중 화면 (로딩 애니메이션)
- 추출 완료 화면 (N개 장소 리스트)
- 추출 실패 화면 (재시도/수동 추가)

**2.2.4 키워드 피드 화면**
- 헤더: 키워드 제목 + 뷰 모드 전환
- 키워드 정보 카드 (통계)
- 필터/정렬 바
- 장소 리스트 (그리드/리스트 전환 가능)

**2.2.5 장소 상세 화면**
- 헤더 이미지 (16:9)
- 기본 정보 (이름/카테고리/평점/주소/전화번호)
- 영업 정보 (현재 상태 + 시간)
- 위치 정보 (지도 미리보기 + 길찾기 버튼)
- 키워드 칩 목록
- 추가 이미지 (그리드 3열)
- 출처 콘텐츠 (가로 스크롤)
- 하단 고정 버튼 (저장/공유)

**2.2.6 북마크 관리 화면**
- 탭 바 (전체/가고 싶은 곳/가본 곳/커스텀)
- 정렬/필터 바
- 장소 리스트 (카드형)
- 스와이프 액션 (삭제/메모 편집)
- 바텀 시트 메뉴 (메모/별점/방문날짜/폴더이동/삭제)

#### 2.3 사용자 플로우 (4개)

**플로우 1: 신규 사용자 온보딩**
```
앱 실행 → 스플래시 → 온보딩 슬라이드 →
로그인/회원가입 → Firebase OAuth →
기존 회원 확인 → [신규] 초기 정보 입력 (3단계) → 홈 화면
```

**플로우 2: AI 장소 추출 및 저장**
```
FAB 클릭 → URL 입력 → 추출 시작 →
처리 중 → AI 분석 → 추출 완료 →
장소 선택 (체크박스) → 폴더 선택 → 저장 완료
```

**플로우 3: 키워드 탐색 → 장소 상세 → 저장**
```
홈 화면 → 키워드 칩 클릭 → 키워드 피드 →
필터 선택 → 장소 카드 클릭 → 장소 상세 →
정보 확인 → 저장 버튼 → 폴더/메모/별점 입력 → 저장 완료
```

**플로우 4: 북마크 관리**
```
북마크 탭 → 폴더 선택 → 장소 목록 →
메뉴 클릭 → 바텀 시트 → [메모/별점/방문날짜/폴더이동/삭제] 선택 →
수정 완료
```

#### 2.4 API 엔드포인트 목록 (30+ 엔드포인트)

**인증 API** (`/api/auth`)
- POST `/sign-in` - Firebase OAuth 로그인
- POST `/reissue` - JWT 토큰 갱신
- POST `/logout` - 로그아웃
- DELETE `/withdraw` - 회원 탈퇴

**회원 관리 API** (`/api/members`)
- POST `/onboarding/terms` - 약관 동의
- POST `/onboarding/birth-date` - 생년월일 입력
- POST `/onboarding/gender` - 성별 선택
- POST `/profile` - 프로필 수정
- GET `/check-name` - 닉네임 중복 검사
- GET `/{memberId}` - 회원 정보 조회

**피드 API** (`/api/feed`)
- GET `/latest/cursor` - 최신 장소 피드 (커서 기반)
- GET `/popular` - 인기 장소 피드 (가중치 적용)
- GET `/my-top-places` - 내 저장 장소 TOP
- GET `/trending-keywords` - 떠오르는 키워드

**키워드 API** (`/api/keywords`)
- GET `/{keyword}` - 키워드 상세 정보
- GET `/{keyword}/places` - 키워드별 장소 목록

**장소 관리 API** (`/api/place`, `/api/bookmarks`)
- GET `/place/{placeId}` - 장소 상세 정보
- GET `/place/temporary` - 임시 저장 장소
- POST `/place/{placeId}/save` - 장소 저장
- DELETE `/place/{placeId}/temporary` - 임시 저장 삭제
- GET `/bookmarks` - 저장 장소 목록 (Offset)
- GET `/bookmarks/cursor` - 저장 장소 목록 (Cursor)
- PATCH `/bookmarks/{bookmarkId}` - 북마크 정보 수정

**콘텐츠/AI 추출 API** (`/api/content`)
- POST `/analyze` - SNS URL 장소 추출 요청
- GET `/{contentId}` - 콘텐츠 정보 조회
- GET `/member` - 내 콘텐츠 목록

**Response 예시 포함**:
- `CursorPageResponse<PlaceDto>` - 커서 기반 페이지네이션
- `PageResponse<PlaceDto>` - Offset 기반 페이지네이션
- `PlaceDetailResponse` - 장소 상세 정보
- `ContentResponse` - AI 추출 결과

#### 2.5 데이터 모델 (5개 주요 Entity)

**Member** - 회원 정보
- id (UUID), email (unique), name (닉네임)
- birthDate, gender, profileImageUrl
- onboardingStatus, memberRole
- serviceTermsAgreed, marketingAgreed
- createdAt, deletedAt (soft delete)

**Place** - 장소 정보
- id (UUID), name, address, roadAddress
- latitude (-90~90), longitude (-180~180)
- category, phone, description
- rating (0.0~5.0), userRatingsTotal
- businessStatus, openingHours[]
- photoUrls[] (최대 10개)
- placeKeywords[] (M:N)

**MemberPlace** - 북마크
- id (UUID), member (FK), place (FK)
- savedStatus (TEMPORARY/SAVED)
- folder, memo (500자), rating (1-5)
- visited, visitedAt, savedAt

**Keyword** - 키워드
- id (UUID), keyword (unique)
- count (사용 횟수)
- trendScore (트렌드 점수)

**Content** - SNS 콘텐츠
- id (UUID), platform (INSTAGRAM/YOUTUBE/TIKTOK/FACEBOOK/TWITTER)
- status (PENDING/PROCESSING/COMPLETED/FAILED)
- originalUrl (unique), title, thumbnailUrl
- platformUploader, caption, summary
- contentPlaces[]

#### 2.6 페이지네이션 전략

**Cursor vs Offset 기반 선택**

| 사용 사례 | 방식 | 이유 |
|-----------|------|------|
| 홈 피드 (최신 장소) | **Cursor** | 새 데이터 추가 시 중복/누락 방지 |
| 홈 피드 (인기 장소) | **Cursor** | 가중치 점수 기반, 무한 스크롤 |
| 내 저장 장소 | **Offset** | 전체 개수 표시 필요 |
| 키워드 피드 | **Offset** | 정렬 기준 변경 빈번 |

**Cursor 응답 구조**:
```json
{
  "content": [...],
  "cursor": {
    "next": "eyJpZCI6IjEyMzQ1Njc4...",
    "hasNext": true
  },
  "totalCount": null
}
```

**Offset 응답 구조**:
```json
{
  "content": [...],
  "page": {
    "number": 0, "size": 20,
    "totalElements": 150, "totalPages": 8,
    "hasNext": true
  },
  "sort": {
    "orderBy": "createdAt", "direction": "DESC"
  }
}
```

#### 2.7 인기도 가중치 알고리즘

**공식**:
```
인기도 점수 = (최근 7일 저장 횟수 × 2) + (7일 이전 저장 횟수 × 1)
```

**예시**:
- 장소 A: 최근 7일 10번 + 그 이전 5번 = (10 × 2) + (5 × 1) = **25점**
- 장소 B: 최근 7일 3번 + 그 이전 20번 = (3 × 2) + (20 × 1) = **26점**

→ 장소 B가 더 높은 점수 (트렌드 반영)

**SQL 구현**:
```sql
SELECT p,
  (SUM(CASE WHEN mp.createdAt >= :since THEN 2 ELSE 1 END)) as weightedScore
FROM Place p
LEFT JOIN MemberPlace mp ON mp.place = p
WHERE mp.deletedAt IS NULL
GROUP BY p
ORDER BY weightedScore DESC
```

#### 2.8 보안 및 인증

**Firebase OAuth 플로우**:
1. 클라이언트: Firebase SDK → Google/Apple 로그인 → Firebase ID Token
2. 클라이언트 → 백엔드: `POST /api/auth/sign-in`
3. 백엔드: Firebase Admin SDK 토큰 검증 → 사용자 정보 추출
4. 백엔드: Member 존재 확인 → JWT 발급 (신규는 Member 생성)
5. 클라이언트: JWT 저장 → `Authorization: Bearer {token}` 헤더 사용

**JWT 구조**:
- Access Token: 1시간 유효, member_id + email + role
- Refresh Token: 7일 유효, Redis 저장 (`RT:{memberId}`)
- Token 갱신: `POST /api/auth/reissue`

**API Key 인증** (AI 서버 → 백엔드):
- Callback 요청 시 `X-API-Key` 헤더 검증
- application.yml 정의 API Key 매칭

---

## 🔧 특이사항 및 주요 기술 결정

### 1. 페이지네이션 하이브리드 전략
- **Cursor 기반**: 실시간성 중요한 피드 (무한 스크롤)
- **Offset 기반**: 전체 개수 표시 필요한 목록

**근거**:
- Cursor는 새 데이터 추가 시 중복/누락 방지
- Offset은 페이지 네비게이션 및 전체 개수 표시 용이

### 2. 가중치 알고리즘 (최근성 반영)
**최근 7일 저장 = 2배 가중치**

**근거**:
- 트렌드 반영: 최근 인기 장소 우선 노출
- 신규 장소도 빠르게 상위 노출 가능
- 오래된 인기 장소는 자연스럽게 하락

### 3. AI 처리 비동기화
**즉시 200 응답 → 백그라운드 처리 → Webhook Callback**

**근거**:
- 사용자 경험: 긴 대기 시간 방지
- 서버 부하: 동시 요청 처리 가능
- 에러 처리: 실패 시 재시도 가능

### 4. Soft Delete 패턴
**deletedAt + 30일 복구 가능**

**근거**:
- 사용자 실수 방지
- 데이터 복구 요청 대응
- 30일 후 Batch Job으로 영구 삭제

### 5. Redis 캐싱 전략
**트렌드 키워드만 1시간 TTL**

**근거**:
- 자주 조회되는 데이터만 캐싱
- 트렌드는 1시간 단위로 충분
- 메모리 효율성 고려

---

## 📦 기술 스택 요약

**Frontend**: Flutter (Dart)
**Backend**: Spring Boot 4.0.1 (Java 21), Multi-Module (7개)
**AI Server**: FastAPI (Python 3.13+)
**Database**: PostgreSQL (Main DB), Redis (Cache + Session)
**Authentication**: Firebase OAuth, JWT
**AI/ML**: Google Gemini 2.5 Flash, Faster-Whisper (STT)
**Geocoding**: Kakao Maps API, Nominatim (Fallback)

**외부 API 종속성**:
- Firebase (Authentication + FCM)
- Google Gemini API (LLM)
- YouTube Data API v3
- Kakao Local API (Geocoding)
- Google Places API (장소 정보)

---

## 🧪 검증 및 다음 단계

### ✅ PRD 완성도 체크리스트
- [x] 프로젝트 비전 및 목표 명확화
- [x] 타겟 사용자 정의
- [x] 핵심 기능 6개 상세 설명
- [x] 시스템 아키텍처 다이어그램
- [x] 사용자 스토리 5개 Epic (Acceptance Criteria 포함)
- [x] 화면별 기능 명세 6개
- [x] 사용자 플로우 4개
- [x] API 엔드포인트 30+ 개 (Request/Response 예시)
- [x] 데이터 모델 5개 Entity
- [x] 페이지네이션 전략 정의
- [x] 가중치 알고리즘 설계
- [x] 보안 및 인증 플로우
- [x] 주요 마일스톤 (3 Phase)

### 📌 PRD 활용 방안

**개발팀용**:
- API 명세서로 활용 (Request/Response 예시 포함)
- 데이터 모델 기반 DB 스키마 설계
- 페이지네이션 구현 가이드
- 보안 체크리스트

**PM/디자이너용**:
- 화면별 기능 명세 참고
- 사용자 플로우 기반 UI/UX 설계
- 사용자 스토리 기반 우선순위 결정

**투자자/이해관계자용**:
- Part 1 Executive Summary 발췌
- 시스템 아키텍처 다이어그램
- 주요 마일스톤 로드맵

---

## 🚀 Next Steps (우선순위별)

### 🔴 Critical (최우선)

**1. Flutter 앱 개발 시작**
- [ ] UI/UX 디자인 시스템 정의 (컬러/타이포그래피/컴포넌트)
- [ ] 6개 주요 화면 구현 (온보딩/홈/AI추출/키워드/상세/북마크)
- [ ] API 연동 (Dio 패키지)
- [ ] 상태 관리 선택 (Provider/Riverpod/Bloc)
- [ ] FCM 푸시 알림 연동
- [ ] 지도 연동 (Kakao/Naver/Google Maps)

**2. Backend API 완성**
- [ ] 피드 API 페이지네이션 구현 (Cursor/Offset)
- [ ] 가중치 알고리즘 적용 (인기 피드)
- [ ] Redis 캐싱 (트렌드 키워드 1시간 TTL)
- [ ] API 테스트 작성 (Unit + Integration)

### 🟡 High (높은 우선순위)

**3. AI 서버 안정화**
- [ ] OCR 기능 재활성화 및 테스트
- [ ] TikTok, Facebook, Twitter 플랫폼 지원
- [ ] 자동 좌표 추출 (Geocoding 통합)
- [ ] 추출 정확도 향상 (LLM 프롬프트 튜닝)
- [ ] 에러 핸들링 강화

**4. 테스트 및 품질 보증**
- [ ] Backend Unit Test (JUnit 5 + Mockito)
- [ ] API Integration Test (MockMvc)
- [ ] AI 서버 추출 정확도 테스트 (목표: Instagram 85%+, YouTube 80%+)
- [ ] Flutter Widget Test
- [ ] E2E 테스트 시나리오 작성

### 🟢 Medium (중간 우선순위)

**5. 베타 테스트 준비**
- [ ] 베타 사용자 50명 모집
- [ ] 피드백 수집 양식 작성 (Google Forms)
- [ ] 앱 배포 (TestFlight/Firebase App Distribution)
- [ ] 모니터링 도구 설정 (Sentry/Firebase Analytics)

**6. 문서화 및 협업**
- [ ] API 문서 자동화 (Swagger/Postman)
- [ ] Git 브랜치 전략 정의 (Git Flow)
- [ ] 코드 리뷰 가이드라인
- [ ] 이슈 템플릿 작성 (Bug Report/Feature Request)

---

## 📌 참고사항

### 보안 관련 주의사항
- Firebase 프로젝트 설정 파일 (`mapsy-fcm.json`) `.gitignore` 추가 필수
- API Key는 환경변수로 관리 (`application.yml` Git 제외)
- JWT Secret Key는 반드시 환경변수 또는 Key Vault 사용
- AI 서버 Callback API Key도 환경변수 관리

### 라이선스 및 규정 준수
- SNS 플랫폼 API 이용 약관 준수 (Instagram/YouTube/TikTok)
- 사용자 동의 하 데이터 수집 (GDPR/개인정보보호법)
- 저작권 침해 방지: SNS 콘텐츠 원본 링크만 저장, 재배포 금지
- Google Places API 사용량 모니터링 (과금 주의)

### 성능 최적화 고려사항
- 이미지 리사이징 및 CDN 사용 (썸네일 최적화)
- DB 인덱스 설계 (검색 성능)
- API Rate Limiting (남용 방지)
- 무한 스크롤 시 메모리 관리 (Flutter)

---

**문서 버전**: v1.0
**마지막 업데이트**: 2026-01-19
**작성자**: Claude (Anthropic AI)
**승인자**: (TBD)

---

**End of Report**
