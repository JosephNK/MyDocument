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

$ rm -rf node_modules/ package-lock.json yarn.lock
$ yarn install
```

### Edit src/App.tsx

```
import React, { Component } from 'react';
import './assets/fomantic/dist/semantic.css';
import { Container, Header, Button } from 'semantic-ui-react';

class App extends Component {
  render() {
    return (
      <Container>
        <Header>
          Fomantic-UI & Semantic-UI-React
        </Header>
        <div>
          <Button primary>Primary</Button>
          <Button secondary>Secondary</Button>
        </div>
      </Container>
    );
  }
}

export default App;
```

### Edit scripts in package.json

```
"scripts": {
  ...
  "watch": "cd src/assets/fomantic/ && gulp watch",
  "build": "cd src/assets/fomantic/ && gulp build && cd ../../.. && react-scripts build",
  ...
},
```


https://medium.com/@fomantic/setting-up-fomantic-ui-with-react-f701b68f736c