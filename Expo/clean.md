
## Basic Clean
```
watchman watch-del-all &&
rm -rf $TMPDIR/react-native-packager-cache-* &&
rm -rf $TMPDIR/metro-bundler-cache-* && 
rm -rf node_modules/ && 
rm -rf yarn.lock &&
yarn cache clean &&
yarn install && 
yarn start -- --reset-cache
```

## Expo Clean
```
watchman watch-del-all &&
rm -rf $TMPDIR/react-native-packager-cache-* &&
rm -rf $TMPDIR/metro-bundler-cache-* && 
rm -rf node_modules/ && 
rm -rf yarn.lock && 
yarn cache clean &&
yarn install && 
expo start -c
```

## Ref
https://medium.com/@abhisheknalwaya/how-to-clear-react-native-cache-c435c258834e

https://gist.github.com/jarretmoses/c2e4786fd342b3444f3bc6beff32098d