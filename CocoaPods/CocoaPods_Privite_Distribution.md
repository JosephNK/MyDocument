### CocoaPods Privite 배포 방법

(1) Cocoa touch framework 생성 
 
``` 
Xcode Cocoa touch framework 생성
```

(2) podspec 생성  

```
pod spec create 프로젝트명
```

(3) podspec 작성

```
open -a Xcode 프로젝트명.podspec
```

(4) podspec 파일 설정 예시

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

(5) podspec 점검

```
pod lib lint
```

(6) 생성한 프로젝트와 podspec 파일과 함께 git에 업로드 (Git Push)

```
git init
git add .  
git commit -m "Initial commit"
git tag 0.1.0
git remote add origin https://github.com/JosephNK/JNKSwiftLib.git
git push -u origin master --tags
```

(7) private repo 생성

```
pod repo add REPO_NAME 원격저장소URL
ex) pod repo add MyLibrary https://~/MyLibrary.git
```

(8) private repo 확인

```
/Users/honggildong/.cocoapods/repos/MyLibrary
ls ~/.cocoapods/repos/
```

(9) 배포 (주의: git 으로 프로젝트로 업로드 할때 주의점은 Tag와 Spec에서 작성한 s.version 하고 동일해야함)

```
pod repo push MyLibrary MyLibrary.podspec
```

참고사이트  
[Raywenderlich create-cocoapod-swift](https://www.raywenderlich.com/99386/create-cocoapod-swift)  
[Raywenderlich create-a-framework-for-ios](https://www.raywenderlich.com/65964/create-a-framework-for-ios)  
[JEP's Diary](http://jepark-diary.tistory.com/14)  
[Woong's CocoaPods 배포하기](http://iw90.tistory.com/239)  