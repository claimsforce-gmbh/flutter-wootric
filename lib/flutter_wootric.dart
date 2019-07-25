import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class FlutterWootric {
  final String clientId;
  final String accountToken;
  final String email;
  final String userId;
  final Map<String, String> properties;

  static const MethodChannel _channel = const MethodChannel('flutter_wootric');

  FlutterWootric(
      {@required this.clientId,
      @required this.accountToken,
      @required this.email,
      this.userId: "",
      this.properties})
      : assert(clientId != null),
        assert(accountToken != null),
        assert(email != null);

  get showWootricSurvey async {
    try {
      await _channel.invokeMethod('showWootricSurvey', {
        "clientId": clientId,
        "accountToken": accountToken,
        "email": email,
        "userId": userId,
        "properties": properties ?? {},
      });
    } on PlatformException catch (exception) {
      print(exception);
    }
  }
}
