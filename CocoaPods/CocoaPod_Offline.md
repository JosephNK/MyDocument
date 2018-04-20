### CocoaPods Offline 설정하기

#### [인터넷 환경 PC]

조건 : 인터넷 되는 OSX에서 CocoaPods가 정상적으로 설치 되어 있고, Specs가 clone 되어 있는 환경

```
$ cd ~/
```

```
// cocoapod.tar.gz로 압축하기

$ tar cvf cocoapod.tar.gz ~/.cocoapods
```

```
// GemBundle 생성 및 CocoaPods Bundle 압축 생성

$ mkdir ~/Download/gemFolder

$ cd ~/Download/gemFolder

$ vi Gemfile

	source 'https://rubygems.org'

	gem 'cocoapods', '~> 1.5.0'


$ bundle install

$ bundle package

$ tar cvf cocoapodsbundle.tgz *
```

```
// Bundler gem & cocoapods gem 다운로드

Bundler Download : https:/rubygem.org/gems/bundler

Cocoapods Download : https:/rubygem.org/gems/cocoapods
```

#### [오프라인 환경 PC]

조건 : bundler-1.16.1.gem, cocoapods-1.5.0.gem, cocoapod.tar.gz, cocoapodsbundle.tgz 필요.

```
// Bundler 설치

$ sudo gem install bundler-1.16.1.gem
```

```
// cocoapods 설치 (만약, pod 명령어가 오류 날 때.. 설차)

$ sudo gem install cocoapods-1.5.0.gem -n /usr/local/bin --verbose
```

```
// Home 경로로 이동

$ cd ~/
```

```
// .cocoapods/repos/master 경로로 CocoaPods Specs Source 압축 풀기 

$ tar xvfz cocoapod.tar.gz  
```

```
// bundle 압축 된 파일 임시로 풀 경로 생성

$ mkdir bundle
```

```
// bundle 경로로 이동

$ cd bundle
```

```
// cocoapods bundle 파일 압축 풀기

$ tar xvfz cocoapodsbundle.tgz
```

```
// bundle 설치

$ bundle install --local
```

```
// pod repo 확인

$ pod repo
```

```
// Xcode 프로젝트에 Podfile 추가

$ vi Podfile

	source 'https://github.com/CocoaPods/Specs.git'

	platform :ios, '9.0'

	use_frameworks!

	inhibit_all_warnings!

	def common_pods
	    pod 'AFNetworking', :path => '~/Downloads/repo_pods/AFNetworking-3.1.0'
	end

	target 'PodLocalTest' do
	    common_pods
	end
```

```
// pod 설치

$ pod install

Analyzing dependencies
Fetching podspec for `AFNetworking` from `~/Downloads/repo_pods/AFNetworking-3.1.0`
Downloading dependencies
Installing AFNetworking (3.2.0)
Generating Pods project
Integrating client project

[!] Please close any current Xcode sessions and use `PodLocalTest.xcworkspace` for this project from now on.
Sending stats
Pod installation complete! There is 1 dependency from the Podfile and 1 total pod installed.

SUCCESS!!
```

```
//
// 만약 dependency 있는 pod인 경우,
// 예로 Facebook SDK의 podspec 파일에 
// 아래와 같이 정의 되어 있는 경우
//
// s.ios.dependency 'Bolts', '~> 1.7
//
// Bolts를 다운 받아서 아래와 같이 직접 설정 해준다.
//
// pod 'Bolts', :path => '~/Downloads/repo_pods/Bolts-ObjC-master'
//

$ vi Podfile

	source 'https://github.com/CocoaPods/Specs.git'

	platform :ios, '9.0'

	use_frameworks!

	inhibit_all_warnings!

	def common_pods
	    pod 'AFNetworking', :path => '~/Downloads/repo_pods/AFNetworking-3.1.0'
	    pod 'PromiseKit', :path => '~/Downloads/repo_pods/PromiseKit-master/'
	    pod 'FBSDKCoreKit', :path => '~/Downloads/repo_pods/facebook-ios-sdk-master'
	    pod 'FBSDKLoginKit', :path => '~/Downloads/repo_pods/facebook-ios-sdk-master'
	    pod 'Bolts', :path => '~/Downloads/repo_pods/Bolts-ObjC-master'
	end

	target 'ProjectName' do
	    common_pods
	end
```	
	
