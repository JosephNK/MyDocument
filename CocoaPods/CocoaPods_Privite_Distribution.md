### CocoaPods Privite 배포 방법

Xcode CocoaFramework 프로젝트 생성  
MyLibrary.podspec 파일 생성  
podspec 파일 설정 예시

```
#
#  Be sure to run `pod spec lint MyLibrary.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

	s.name = "MyLibrary"
	s.version = '0.0.1'
	s.summary = "MyLibrary Summary"
	s.homepage = "https://~~/~~/~~"
	s.license = { 
		:type => "MIT", :file => "LICENSE" 
	}
	s.author = { 
		"JosephNK" => "nkw0608@gmail.com" 
	}
	
	s.platform = :ios, "10.0"
	
	s.source = { 
		:git => "https://~/MyLibrary.git", :tag => "0.0.1" 
	}
	
	s.source_files = "MyLibrary/Sources/Swift/**/*.{swift}"
	
	s.subspec 'ObjC' do |objc|
	     objc.source_files = 'MyLibrary/Sources/ObjC/**/*.{h,m}'
	end
	
	s.resources = "MyLibrary/Resources/**/*.{png,jpeg,jpg,storyboard,xib}"
	
	s.frameworks = "UIKit"
	s.requires_arc = true
	
	#s.resource_bundles = {
	#    'MyLibrary' => ['Pod/Assets/*.png']
	#}
	#s.vendored_frameworks = "MyLibrary/SDK/Facebook/Bolts.framework", "MyLibrary/SDK/Facebook/FBSDKCoreKit.framework", "MyLibrary/SDK/Facebook/FBSDKLoginKit.framework", "MyLibrary/SDK/Facebook/FBSDKShareKit.framework"
	
	s.dependency 'SnapKit'
	s.dependency 'Cloudinary'
	s.dependency 'Alamofire'
	s.dependency 'PromiseKit'
	s.dependency 'FacebookCore'
	s.dependency 'FacebookLogin'
	s.dependency 'FacebookShare'
	
	s.pod_target_xcconfig = {
	    'OTHER_SWIFT_FLAGS[config=Debug]' => '-DFTDEBUG'
	}

end
```

spec 문서가 잘 작성되었는지 테스트 하는 명령어

```
pod lib lint
```

생성한 프로젝트와 podspec 파일과 함께 git에 업로드

(git 으로 프로젝트로 업로드 할때 주의점은 Tag와 Spec에서 작성한 s.version 하고 동일해야함)

다음은 Private 저장소를 생성

```
pod repo add REPO_NAME 원격저장소URL
```

```
pod repo add MyLibrary https://~/MyLibrary.git
```


/Users/honggildong/.cocoapods/repos/MyLibrary  
위 경로에 위 명령어를 통해서 만들어진 프로젝트가 생성 확인.

그리고 Git에서 배포했던 0.1.0 버전을 Private 저장소로 배포합니다.
명령어 실행 : pod repo push 저장소이름 .podspec파일

```
pod repo push MyLibrary MyLibrary.podspec
```

사용시

```
pod 'MyLibrary'
```

참고사이트  
[Raywenderlich create-cocoapod-swift](https://www.raywenderlich.com/99386/create-cocoapod-swift)  
[Raywenderlich create-a-framework-for-ios](https://www.raywenderlich.com/65964/create-a-framework-for-ios)  
[JEP's Diary](http://jepark-diary.tistory.com/14)  
[Woong's CocoaPods 배포하기](http://iw90.tistory.com/239)  