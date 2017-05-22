### git gitignore 설정

- gitignore 파일 내용

``` 
# Xcode
#
build/
*.pbxuser
!default.pbxuser
*.mode1v3
!default.mode1v3
*.mode2v3
!default.mode2v3
*.perspectivev3
!default.perspectivev3
xcuserdata
*.xccheckout
*.moved-aside
DerivedData
*.hmap
*.ipa
*.xcuserstate

# CocoaPods
#
# We recommend against adding the Pods directory to your .gitignore. However
# you should judge for yourself, the pros and cons are mentioned at:
# http://guides.cocoapods.org/using/using-cocoapods.html#should-i-ignore-the-pods-directory-in-source-control
#
# Pods/
``` 

Xcode 관련 설명

``` 
원격지에 *.xcuserstate 올라갔으면, 아래 명령어를 이용하여 제거 후, commit 해서 사용
git rm --cached *.xcuserstate
``` 

참고사이트  
[참고사이트1](http://www.shako.net/blog/236/)  
[참고사이트2](http://spacetech.dk/xcode-cant-ignore-userinterfacestate-xcuserstate.html)  
[참고사이트3](http://spacetech.dk/xcode-cant-ignore-userinterfacestate-xcuserstate.html)  
[참고사이트4](http://kyejusung.com/2015/05/userinterfacestate-xcuserstate-%ED%8C%8C%EC%9D%BC-git-tracking%EC%97%90%EC%84%9C-%EC%A0%9C%EC%99%B8%EC%8B%9C%ED%82%A4%EA%B8%B0/)  

