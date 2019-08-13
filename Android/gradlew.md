## ./gradlew assembleRelease

#### release build apk 일반적인 설정 방식

Android build.grade(Module:app) 파일 설정

```
signingConfigs {
    release {
      storeFile file('/Users/nkw0608/cer/release_name.keystore')
      storePassword "password1234"
      keyAlias "release_name"
      keyPassword "password1234"
    }
}
buildTypes {
    release {
      ...
      signingConfig signingConfigs.release
    }
}
```

위에 문제점은 협업시 서로 다른 환경이고 또는 build.grade이 햡업도구(git)에 노출이 될수 있는 문제.

#### properties 별도 분리 방식

예로들어 안드로이드 프로젝트가 위치가 아래와 같다면..

```
/Users/nkw0608/dev/MyApp
```

keystore.properties을 아래 위치에 생성 (프로젝트에 포함되지 않게 생성)

```
/Users/nkw0608/dev/
```

keystore.properties 파일 안에 설정 내용 예시

```
storeFile=../../release_name.keystore
storePassword=password1234
keyAlias=release_name
keyPassword=password1234
```

Android build.grade(Module:app) 파일 설정

```

def keystorePropertiesFile = rootProject.file("../keystore.properties")
def keystoreProperties = new Properties()
keystoreProperties.load(new FileInputStream(keystorePropertiesFile))

android {
  ...

  signingConfigs {
    release {
      storeFile file(keystoreProperties['storeFile'])
      storePassword keystoreProperties['storePassword']
      keyAlias keystoreProperties['keyAlias']
      keyPassword keystoreProperties['keyPassword']
    }
  }
  buildTypes {
      release {
          ...
          signingConfig signingConfigs.release
      }
  }

}

```




