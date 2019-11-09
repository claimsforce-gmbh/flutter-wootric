import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class FlutterWootric {
  static const MethodChannel _channel = const MethodChannel('flutter_wootric');

  static configure({@required String clientId, @required String accountToken}) {
    assert(clientId != null);
    assert(accountToken != null);
    
    _channel.invokeMethod('configure', {
      "clientId": clientId,
      "accountToken": accountToken,
    });
  }

  static setEndUserEmail(String endUserEmail) {
    assert(endUserEmail != null);
    _channel.invokeMethod('setEndUserEmail', {
      'endUserEmail': endUserEmail,
    });
  }

  static setEndUserExternalId(String endUserExternalId) {
    assert(endUserExternalId != null);
    _channel.invokeMethod('setEndUserExternalId', {
      'endUserExternalId': endUserExternalId,
    });
  }

  static setEndUserPropteries(Map<String, dynamic> endUserProperties) {
    assert(endUserProperties != null);
    _channel.invokeMethod('setEndUserPropteries', {
      'endUserProperties': endUserProperties,
    });
  }

  static forceSurvey(bool forceSurvey) {
    _channel.invokeMethod('forceSurvey', {
      'forceSurvey': forceSurvey,
    });
  }

  static surveyImmediately(bool surveyImmediately) {
    _channel.invokeMethod('surveyImmediately', {
      'surveyImmediately': surveyImmediately,
    });
  }

  static setEndUserCreatedAt(int timestamp) {
    _channel.invokeMethod('setEndUserCreatedAt', {
      'endUserCreatedAt': timestamp,
    });
  }

  static setFirstSurveyAfter(int numberOfDays) {
    _channel.invokeMethod('setFirstSurveyAfter', {
      'numberOfDays': numberOfDays,
    });
  }

  static setProductNameForEndUser(String productName) {
    _channel.invokeMethod('setProductNameForEndUser', {
      'productName': productName,
    });
  }
  
  static setSurveyedDefault(bool surveyedDefault) {
    _channel.invokeMethod('setSurveyedDefault', {
      'surveyedDefault': surveyedDefault,
    });
  }

  static passScoreAndTextToURL(bool passScoreAndTextToURL) {
    _channel.invokeMethod('passScoreAndTextToURL', {
      'passScoreAndTextToURL': passScoreAndTextToURL,
    });
  }

  static skipFeedbackScreenForPromoter(bool skipFeedbackScreenForPromoter) {
    _channel.invokeMethod('skipFeedbackScreenForPromoter', {
      'skipFeedbackScreenForPromoter': skipFeedbackScreenForPromoter,
    });
  }

  static showOptOut(bool showOptOut) {
    _channel.invokeMethod('showOptOut', {
      'showOptOut': showOptOut,
    });
  }

  static setLogLevelNone() {
    _channel.invokeMethod('setLogLevelNone');
  }

  static setLogLevelError() {
    _channel.invokeMethod('setLogLevelError');
  }

  static setLogLevelVerbose() {
    _channel.invokeMethod('setLogLevelVerbose');
  }

  static setCustomQuestion(String question) {
    _channel.invokeMethod('setCustomQuestion', {
      'question': question,
    });
  }

  static setCustomFinalThankYou(String thankYou) {
    _channel.invokeMethod('setCustomFinalThankYou', {
      'thankYou': thankYou,
    });
  }

  static showSurvey() {
    _channel.invokeMethod('showWootricSurvey');
  }
}
