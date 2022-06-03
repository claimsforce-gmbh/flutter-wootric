import 'package:flutter/services.dart';

class FlutterWootric {
  static const MethodChannel _channel = const MethodChannel('flutter_wootric');

  /// Get platform version
  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// Configure Wootric with your individual [clientId] and
  /// [accountToken].
  static Future<void> configure(
      {required String? clientId, required String? accountToken}) async {
    assert(clientId != null);
    assert(accountToken != null);

    _channel.invokeMethod('configure', {
      "clientId": clientId,
      "accountToken": accountToken,
    });
  }

  /// While [endUserEmail] is not required it is HIGHLY recommended to set it if possible.
  static Future<void> setEndUserEmail(String? endUserEmail) async {
    assert(endUserEmail != null);
    _channel.invokeMethod('setEndUserEmail', {
      'endUserEmail': endUserEmail,
    });
  }

  /// Set an [endUserExternalId] for the end user. This value is optional.
  static Future<void> setEndUserExternalId(String? endUserExternalId) async {
    assert(endUserExternalId != null);
    _channel.invokeMethod('setEndUserExternalId', {
      'endUserExternalId': endUserExternalId,
    });
  }

  /// [endUserProperties] can be provided as an Map<String, String> object.
  static Future<void> setEndUserPropteries(
      Map<String, String>? endUserProperties) async {
    assert(endUserProperties != null);
    _channel.invokeMethod('setEndUserProperties', {
      'endUserProperties': endUserProperties,
    });
  }

  /// If [forceSurvey] is set to true, the survey is displayed
  /// skipping eligibility check AND even if user was already surveyed.
  /// This is for test purposes only as it will display the survey every time and for every user.
  static Future<void> forceSurvey(bool forceSurvey) async {
    _channel.invokeMethod('forceSurvey', {
      'forceSurvey': forceSurvey,
    });
  }

  /// If [surveyImmediately] is set to true and user wasn’t surveyed yet -
  /// eligibility check will return true and survey will be displayed.
  static Future<void> surveyImmediately(bool surveyImmediately) async {
    _channel.invokeMethod('surveyImmediately', {
      'surveyImmediately': surveyImmediately,
    });
  }

  /// When creating a new end user for survey, it will set the external creation date
  /// (so for example, date, when end user was created in your iOS application).
  /// This value is also used in eligibility check, to determine if end user should be surveyed.
  static Future<void> setEndUserCreatedAt(int timestamp) async {
    _channel.invokeMethod('setEndUserCreatedAt', {
      'endUserCreatedAt': timestamp,
    });
  }

  /// If not set, defaults to value from admin panel.
  /// Used to check if end user was created/last seen earlier than ago and therefore if survey is required.
  static Future<void> setFirstSurveyAfter(int numberOfDays) async {
    _channel.invokeMethod('setFirstSurveyAfter', {
      'numberOfDays': numberOfDays,
    });
  }

  /// iOS relevant only: Right after a vote or dismiss we are setting a NSUserDefault
  /// that lasts for 90 days and indicates that end user was already surveyed on this device.
  /// We are doing this to lower the requests amount to our eligibility server.
  /// If your survey throttle is different than 90 days and/or you don’t want to set the surveyed “cookie”
  /// you can set this option [surveyedDefault] to false.
  static Future<void> setSurveyedDefault(bool surveyedDefault) async {
    _channel.invokeMethod('setSurveyedDefault', {
      'surveyedDefault': surveyedDefault,
    });
  }

  /// If you enable this setting, score and feedback text will be added as wootric_score and wootric_text params
  /// to the “thank you” URL you have provided.
  static Future<void> passScoreAndTextToURL(bool passScoreAndTextToURL) async {
    _channel.invokeMethod('passScoreAndTextToURL', {
      'passScoreAndTextToURL': passScoreAndTextToURL,
    });
  }

  /// With this option enabled, promoters (score 9-10) will be taken directly to third (social share) screen,
  /// skipping the second (feedback) one.
  static Future<void> skipFeedbackScreenForPromoter(
      bool skipFeedbackScreenForPromoter) async {
    _channel.invokeMethod('skipFeedbackScreenForPromoter', {
      'skipFeedbackScreenForPromoter': skipFeedbackScreenForPromoter,
    });
  }

  /// If [showOptOut] is set to true, it will show an option for the end user
  /// to opt out of being surveyed. Default value is NO.
  static Future<void> showOptOut(bool showOptOut) async {
    _channel.invokeMethod('showOptOut', {
      'showOptOut': showOptOut,
    });
  }

  /// Set WTRLogger level to None i.e. it won’t show any log from the WootricSDK.
  static Future<void> setLogLevelNone() async {
    _channel.invokeMethod('setLogLevelNone');
  }

  /// Set WTRLogger level to Error i.e. it will only show error logs from the WootricSDK.
  static Future<void> setLogLevelError() async {
    _channel.invokeMethod('setLogLevelError');
  }

  /// Set WTRLogger level to Verbose i.e. it will show all logs from the WootricSDK.
  static Future<void> setLogLevelVerbose() async {
    _channel.invokeMethod('setLogLevelVerbose');
  }

  /// Wootric allows you to set a custom language for the survey modal.
  /// To set a custom language pass appropriate [languageCode].
  /// Please be advised, that custom messages and/or placeholder, takes precedence over language settings.
  static Future<void> setLanguageCode(String languageCode) async {
    _channel.invokeMethod('setLanguageCode', {
      'languageCode': languageCode,
    });
  }

  /// Display Wootric survey driven by configured settings.
  static Future<void> showSurvey() async {
    _channel.invokeMethod('showWootricSurvey');
  }
}
