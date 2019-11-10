import 'package:flutter/material.dart';
import 'package:flutter_wootric/flutter_wootric.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    FlutterWootric.configure(
      clientId: "<CLIENT_ID>", //TODO Your Wootric Client ID
      accountToken: "<ACCOUNT_TOKEN>", //TODO Your Wootric Account Token
    );
    FlutterWootric.setEndUserEmail('example@test.com');
    FlutterWootric.setEndUserExternalId('123456789');
    FlutterWootric.setEndUserPropteries({
      'country': 'Germany',
      'age': "36",
    });
    FlutterWootric.forceSurvey(true);
    FlutterWootric.showSurvey();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wootric example app'),
        ),
        body: Center(
          child: MaterialButton(
            onPressed: null,
            child: Text('Show Wootric Survey'),
          ),
        ),
      ),
    );
  }
}
