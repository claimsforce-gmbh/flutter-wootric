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
      clientId: "e9324ead717508c77c02cbfb2921685029948a7dae1f876b95e98b7abdf1ee27", //TODO Your Wootric Client ID
      accountToken: "NPS-0df148a5", //TODO Your Wootric Account Token
    );
    FlutterWootric.setEndUserEmail('kevin.luecke@me.com');
    FlutterWootric.setEndUserExternalId('123456789');
    FlutterWootric.setEndUserPropteries({
      'country': 'Germany',
      'age': 36,
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
