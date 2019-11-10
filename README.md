# flutter-wootric

A Wootric SDK Wrapper for Flutter.
https://www.wootric.com

## Example

1. Import flutter-wootric 
2. Init the library with your credentials
```
FlutterWootric.configure(
  clientId: "<CLIENT_ID",
  accountToken: "<ACCOUNT_TOKEN>",
);         
```
3. Setup your survey properties 
 // most of the original features already supported
```
 FlutterWootric.setEndUserEmail('test@example.com');
 FlutterWootric.setEndUserExternalId('123456789');
 FlutterWootric.setEndUserPropteries({
    'country': 'Germany',
    'age': "36",
  });
  FlutterWootric.showSurvey();          
```
4. Call showWootricSurvey

```
FlutterWootric.forceSurvey(true); //Only for test
FlutterWootric.showSurvey();          
```

# Todos
- [x] Support end user properties
- [x] Support individual survey settings
- [x] Support logging 
- [ ] Support Callbacks
- [ ] Support Message Customization
- [ ] Support Color Customization