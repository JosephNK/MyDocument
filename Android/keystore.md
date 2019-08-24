
### Create Key

```
keytool -genkey -v -keystore release_key.keystore -alias release_key -keyalg RSA -keysize 2048 -validity 36500
```

### Key info

```
keytool -list -v -keystore release_key.keystore -alias release_key -storepass password1234 -keypass password1234

```
