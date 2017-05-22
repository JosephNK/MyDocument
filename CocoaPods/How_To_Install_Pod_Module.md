### CocoaPods Pod 모듈 사용 방법

일반적인 프로젝트에서 사용시 Podfile 설정 예시

```
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'

use_frameworks!

def common_pods
	pod 'SnapKit'
end

target 'Project명' do
    common_pods
end

```

Workspace에서 사용시 Podfile 설정 예시

```
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'

use_frameworks!

workspace 'Workspace명'

def common_pods
    pod 'SnapKit', '~> 3.2.0'
end

target 'MyLibrary' do
    workspace 'Workspace명'
    common_pods
    project 'MyLibrary/MyLibrary.xcodeproj'
    target 'MyLibraryDemo' do
        inherit! :search_paths
        common_pods
    end
end

target 'MyFirstApp' do
    workspace 'Workspace명'
    common_pods
    project 'MyFirstApp/MyFirstApp.xcodeproj'
end

target 'MySecondApp' do
    workspace 'Workspace명'
    common_pods
    project 'MySecondApp/MySecondApp.xcodeproj'
end
```