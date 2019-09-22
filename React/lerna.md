```
$ npm install lerna -g
$ mkdir lerna-repo && cd $_
$ npx lerna init
```

```
lerna.json

...
"npmClient": "yarn",
...

```

```
$ cd packages 
$ npx create-react-app my-module --typescript
$ cd my-module
$ npm install gulp -D
$ npm install fomantic-ui semantic-ui-react --save
```

```
? Where should we put Semantic UI inside your project?
=> assets/fomantic
```

```
$ rm -rf node_modules/ package-lock.json yarn.lock
$ yarn install
```

```
$ rm -rf src/ && mkdir src && cd src
$ touch Button.tsx index.ts types.ts
```

```
[Button.tsx]

import '../assets/fomantic/dist/semantic.css';
import { Button } from 'semantic-ui-react';

export default Button;
```

```
[index.ts]

export { default as Button } from './Button';
export * from './Button';
```

```
[types.ts]

export * from "./index"
```

```
package.json

{
  "name": "@my/module",
  ...
  "files": ["lib"],
  "main": "./lib/index.js",
  "types": "./lib/types.d.ts",
  ...
  "scripts": {
    ...
    "build:pkg": "yarn clean && yarn build:gulp && yarn build:tsc",
    "build:tsc": "tsc -p ./tsconfig.json",
    "build:gulp": "cd assets/fomantic/ && gulp build",
    "watch:tsc": "tsc --watch",
    "watch:gulp": "cd assets/fomantic/ && gulp watch",
    "clean": "rm -rf lib/"
    ...
  },
  ...
}
```

```
tsconfig.json

{
  "compilerOptions": {
    "esModuleInterop": true,
    "baseUrl": ".",
    "outDir": "./lib",
    "module": "esnext",
    "target": "es5",
    "lib": ["es6", "dom", "dom.iterable", "esnext"],
    "sourceMap": true,
    "jsx": "react",
    "skipLibCheck": true,
    "moduleResolution": "node",
    "rootDir": "src",
    "forceConsistentCasingInFileNames": true,
    "noImplicitReturns": true,
    "noImplicitThis": true,
    "noImplicitAny": true,
    "importHelpers": true,
    "strictNullChecks": true,
    "suppressImplicitAnyIndexErrors": true,
    "noUnusedLocals": false,
    "declaration": true,
    "declarationMap": true,
    "allowSyntheticDefaultImports": true,
    "isolatedModules": false,
    "noEmit": false,
  },
  "include": [
    "src"
  ]
}
```

```
$ cd .. (Location: lerna-repo/packages)
$ npx create-react-app my-app --typescript
$ cd my-app
```

```
package.json

"dependencies": {
	...
	"@my/module": "0.1.0"
	...
},
```

```
App.tsx

...
import { Button } from "@my/module"

  return (
    ...
    <div>
      <Button primary>Primary</Button>
      <Button secondary>Secondary</Button>
    </div>
    ...
  )
...
```

```
$ cd .. (Location: lerna-repo)
$ lerna run build:pkg
$ cd packages/my-app
$ yarn start
```

https://www.jannikbuschke.de/blog/monorepo-with-lerna-react-and-typescript/




