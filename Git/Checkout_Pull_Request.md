## Checkout github pull requests locally

프로젝트에서 vi .git/config 파일

추가

```
fetch = +refs/pull/*/head:refs/remotes/upstream/pr/*
```

before

```
[remote "origin"]
	...
	fetch = +refs/heads/*:refs/remotes/origin/*
```

after

```
[remote "origin"]
	...
	fetch = +refs/heads/*:refs/remotes/origin/*
    fetch = +refs/pull/*/head:refs/remotes/upstream/pr/*
```
