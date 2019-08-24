
### Create Key

```
keytool -genkey -v -keystore release_key.keystore -alias release_key -keyalg RSA -keysize 2048 -validity 36500
```

### Key info

```
keytool -list -v -keystore release_key.keystore -alias release_key -storepass password1234 -keypass password1234

별칭 이름: release_key
생성 날짜: Aug 24, 2019
항목 유형: PrivateKeyEntry
인증서 체인 길이: 1
인증서[1]:
소유자: blah blah
발행자: blah blah
일련 번호: blah blah
적합한 시작 날짜: blah blah
인증서 지문:
MD5:  blah blah
SHA1: blah blah
SHA256: blah blah
서명 알고리즘 이름: SHA256withRSA
주체 공용 키 알고리즘: 2048비트 RSA 키
버전: 3
```
