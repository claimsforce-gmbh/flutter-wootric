# flutter-wootric

A Wootric SDK Wrapper for Flutter.
https://www.wootric.com

#Example

1. Import flutter-wootric 
2. Init the library with your credentials

```
final wootric= FlutterWootric(
                clientId: "<CLIENT_ID>", //Your Wootric Client ID
                accountToken: "<ACCOUNT_TOKEN>", //Your Wootric Account Token
                email: "test@example.com",
                userId: "1234567",
                properties: {
                  "language": "US",
                  "app-version": "1.0.15",
                },
              );
              
```

3. Call showWootricSurvey

```
wootric.showWootricSurvey;
```

## Getting Started with Flutter

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
