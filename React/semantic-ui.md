## Setting up Fomantic-UI with React

```
$ npm install create-react-app gulp-cli -g
$ npx create-react-app test-semantic-ui --typescript
$ npm install gulp -D
$ npm install fomantic-ui semantic-ui-react --save
```

```
? Where should we put Semantic UI inside your project?
=> src/assets/fomantic
```

```
$ cd src/assets/fomantic
$ npx gulp build
```

```
$ yarn start

error: could not find a declaration file for module 'react'

$ rm -rf node_modules/
$ rm -rf package-lock.json
$ rm -rf yarn.lock
$ yarn install
```

### edit scripts in package.json

```
"scripts": {
  ...
  "watch": "cd src/assets/fomantic/ && gulp watch",
  "build": "cd src/assets/fomantic/ && gulp build && cd ../../.. && react-scripts build",
  ...
},
```


https://medium.com/@fomantic/setting-up-fomantic-ui-with-react-f701b68f736c