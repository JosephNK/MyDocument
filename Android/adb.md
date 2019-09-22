## apk 디바이스에 설치

```
$ adb devices
List of devices attached
04157df48d95ac3a	device

$ adb -s 04157df48d95ac3a install app-release_1_0_0_1.apk 
```

# 에뮬레이터 실행
```
$ emulator -list-avds
Nexus_5X_API_28
Pixel_2_API_29
Pixel_API_28

$ emulator @Nexus_5X_API_28
```