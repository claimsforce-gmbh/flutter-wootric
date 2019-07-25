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
            onPressed: () {
              final wootric= FlutterWootric(
                clientId: "<CLIENT_ID>", //Your Wootric Client ID
                accountToken: "<ACCOUNT_TOKEN>", //Your Wootric Account Token
                email: "test@example.com", //The users mail
                userId: "1234567",
                properties: {
                  "country": "Germany",
                  "app-version": "1.0.15",
                },
              );
              wootric.showWootricSurvey;
            },
            child: Text('Show Wootric Survey'),
          ),
        ),
      ),
    );
  }
}
