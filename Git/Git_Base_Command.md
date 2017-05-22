### 자주 사용하는 Git 기본 명령어

```
git pull
```

> 원격저장소의 변경사항을 가져와서 로컬브랜치에 합치는 작업을 합니다.

```
git add -A
```

> untracked files의 파일들을 git가 추적하도록 하거나 파일은 수정했지만 아직 스테이징 영역에 올라가지 않은(Changed but not updated) 파일들을 스테이징 영역에 올립니다. -A 옵션은 All을 의미

```
git commit -m 'modify.'
```

> 스테이징 영역에 올라가 있는 파일들을 커밋합니다.

```
git tag 1.1.0
```

> 브랜치명의 현재시점에 태그명으로 된 태그를 붙힙니다.

```
git push -u origin master --tags -v
```

> origin 저장소에 푸싱하며 현재 지역브랜치와 같은 이름의 브랜치에 푸싱합니다. 로컬에서 tag를 달았을 경우에 기본적으로 푸싱하지 않기 때문에 git push origin 태그명이나 모든 태그를 올리기 위해서 git push origin --tags를 사용해야 합니다.