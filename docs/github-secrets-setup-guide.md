# GitHub Actions Secrets 설정 가이드

Share Extension 추가로 인해 새로운 프로비저닝 프로파일 Secrets를 추가해야 합니다.

## 📋 추가할 Secrets

iOS TestFlight 배포를 위해 아래 2개의 새 Secrets를 GitHub Repository Settings에 추가하세요.

### 1. APPLE_PROVISIONING_PROFILE_SHARE_BASE64

**설명**: Share Extension용 프로비저닝 프로파일 파일 (base64 인코딩)

**생성 방법**:

1. Apple Developer Portal에서 Share Extension용 프로비저닝 프로파일 다운로드
   - Profile Name: `MapSy-Share-AppStore-2026`
   - Bundle ID: `com.elipair.mapsy.share`
   - Type: App Store Distribution

2. 다운로드한 파일을 base64로 인코딩:
   ```bash
   base64 -i ~/Downloads/MapSy_Share_AppStore_2026.mobileprovision | pbcopy
   ```
   (macOS의 경우 자동으로 클립보드에 복사됨)

3. GitHub Repository → Settings → Secrets and variables → Actions → New repository secret
   - Name: `APPLE_PROVISIONING_PROFILE_SHARE_BASE64`
   - Value: 복사한 base64 문자열 붙여넣기

---

### 2. IOS_PROVISIONING_PROFILE_SHARE_NAME

**설명**: Share Extension용 프로비저닝 프로파일 이름

**값**: `MapSy-Share-AppStore-2026`

**설정 방법**:

1. GitHub Repository → Settings → Secrets and variables → Actions → New repository secret
   - Name: `IOS_PROVISIONING_PROFILE_SHARE_NAME`
   - Value: `MapSy-Share-AppStore-2026`

---

## ✅ 기존 Secrets (변경 없음)

아래 Secrets는 **그대로 유지**합니다. 수정하거나 삭제하지 마세요.

| Secret Name | 설명 | 유지 여부 |
|-------------|------|----------|
| `APPLE_PROVISIONING_PROFILE_BASE64` | 메인 앱 프로파일 (base64) | ✅ 유지 |
| `IOS_PROVISIONING_PROFILE_NAME` | 메인 앱 프로파일 이름 | ✅ 유지 |
| `APPLE_CERTIFICATE_BASE64` | Apple Distribution 인증서 | ✅ 유지 |
| `APPLE_CERTIFICATE_PASSWORD` | 인증서 비밀번호 | ✅ 유지 |
| `APP_STORE_CONNECT_API_KEY_ID` | App Store Connect API Key ID | ✅ 유지 |
| `APP_STORE_CONNECT_ISSUER_ID` | App Store Connect Issuer ID | ✅ 유지 |
| `APP_STORE_CONNECT_API_KEY_BASE64` | API Key 파일 (base64) | ✅ 유지 |

---

## 🔍 설정 완료 확인

모든 Secrets 설정 후, GitHub Actions에서 다음을 확인하세요:

1. Repository → Settings → Secrets and variables → Actions
2. 총 **9개의 Secrets**가 있어야 함:
   - 기존 7개 + 새로 추가한 2개

---

## 🚀 배포 테스트

Secrets 설정 완료 후:

1. **테스트 브랜치에서 먼저 확인**:
   ```bash
   git checkout -b test/share-extension-cicd
   git push origin test/share-extension-cicd
   ```

2. **GitHub Actions에서 수동 실행**:
   - Actions → PROJECT-Flutter-iOS-Test-TestFlight → Run workflow
   - 브랜치 선택: `test/share-extension-cicd`

3. **로그 확인**:
   - "Install Provisioning Profiles" 스텝에서 두 프로파일 모두 설치되는지 확인
   - "✅ 메인 앱 프로파일 설치 완료" 로그 확인
   - "✅ Share Extension 프로파일 설치 완료" 로그 확인

4. **TestFlight 확인**:
   - App Store Connect → TestFlight
   - 업로드된 빌드에 Share Extension 포함 여부 확인

---

## ⚠️ 문제 해결

### 프로파일 설치 실패 시

**증상**: "Install Provisioning Profiles" 스텝 실패

**해결 방법**:
1. Secret 이름 철자 확인 (대소문자 정확히)
2. base64 인코딩이 올바른지 확인
3. 프로파일 파일이 유효한지 확인 (만료되지 않았는지)

### 프로파일 이름 불일치

**증상**: "exportArchive" 스텝에서 프로파일을 찾을 수 없음

**해결 방법**:
1. Apple Developer Portal에서 정확한 프로파일 이름 확인
2. `IOS_PROVISIONING_PROFILE_SHARE_NAME` 값이 정확한지 확인
3. `ios/ExportOptions.plist`의 프로파일 이름과 일치하는지 확인

---

## 📞 추가 도움이 필요하신가요?

문제가 계속되면 다음을 확인하세요:
- GitHub Actions 워크플로우 로그
- Apple Developer Portal의 프로비저닝 프로파일 상태
- Xcode에서 로컬 빌드가 성공하는지

---

**마지막 업데이트**: 2026-01-19
