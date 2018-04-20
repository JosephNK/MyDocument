### CocoaPods Offline 설정하기

[인터넷 환경 PC]

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
