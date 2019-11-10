#import "FlutterWootricPlugin.h"
#import <WootricSDK/WootricSDK.h>

@implementation FlutterWootricPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_wootric"
            binaryMessenger:[registrar messenger]];
  FlutterWootricPlugin* instance = [[FlutterWootricPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"configure" isEqualToString:call.method]) {
    NSString *clientId = call.arguments[@"clientId"];
    NSString *accountToken = call.arguments[@"accountToken"];
    [Wootric configureWithClientID:clientId accountToken: accountToken];
  } else if ([@"setEndUserEmail" isEqualToString:call.method]) {
    NSString *endUserEmail = call.arguments[@"endUserEmail"];
    [Wootric setEndUserEmail: endUserEmail];
  } else if ([@"setEndUserExternalId" isEqualToString:call.method]) {
    NSString *endUserExternalId = call.arguments[@"endUserExternalId"];
    [Wootric setEndUserExternalId: endUserExternalId];
  } else if ([@"setEndUserProperties" isEqualToString:call.method]) {
    NSDictionary *endUserProperties = call.arguments[@"endUserProperties"];
    [Wootric setEndUserProperties: endUserProperties];
  } else if ([@"forceSurvey" isEqualToString:call.method]) {
    NSNumber *forceSurvey = call.arguments[@"forceSurvey"];
    [Wootric forceSurvey: [forceSurvey boolValue]];
  } else if ([@"surveyImmediately" isEqualToString:call.method]) {
    NSNumber *surveyImmediately = call.arguments[@"surveyImmediately"];
    [Wootric surveyImmediately: [surveyImmediately boolValue]];
  } else if ([@"setEndUserCreatedAt" isEqualToString:call.method]) {
    NSNumber *endUserCreatedAt = call.arguments[@"endUserCreatedAt"];
    [Wootric setEndUserCreatedAt: endUserCreatedAt];
  } else if ([@"setFirstSurveyAfter" isEqualToString:call.method]) {
    NSNumber *numberOfDays = call.arguments[@"numberOfDays"];
    [Wootric setFirstSurveyAfter: numberOfDays];
  } else if ([@"setSurveyedDefault" isEqualToString:call.method]) {
    NSNumber* surveyedDefault = call.arguments[@"surveyedDefault"];
    [Wootric setSurveyedDefault: [surveyedDefault boolValue]];
  } else if ([@"passScoreAndTextToURL" isEqualToString:call.method]) {
    NSNumber* passScoreAndTextToURL = call.arguments[@"passScoreAndTextToURL"];
    [Wootric passScoreAndTextToURL: [passScoreAndTextToURL boolValue]];
  } else if ([@"skipFeedbackScreenForPromoter" isEqualToString:call.method]) {
    NSNumber* skipFeedbackScreenForPromoter = call.arguments[@"skipFeedbackScreenForPromoter"];
    [Wootric skipFeedbackScreenForPromoter: [skipFeedbackScreenForPromoter boolValue]];
  } else if ([@"showOptOut" isEqualToString:call.method]) {
    NSNumber* showOptOut = call.arguments[@"showOptOut"];
    [Wootric showOptOut: [showOptOut boolValue]];
  } else if ([@"setLogLevelNone" isEqualToString:call.method]) {
    [Wootric setLogLevelNone];
  } else if ([@"setLogLevelError" isEqualToString:call.method]) {
    [Wootric setLogLevelError];
  } else if ([@"setLogLevelVerbose" isEqualToString:call.method]) {
    [Wootric setLogLevelVerbose];
  } else if ([@"setLanguageCode" isEqualToString:call.method]) {
    NSString *languageCode = call.arguments[@"languageCode"];
    [Wootric setCustomLanguage: languageCode];
  } else if ([@"showWootricSurvey" isEqualToString:call.method]) {
    UIViewController *rootController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [Wootric showSurveyInViewController:rootController];
  }
}

@end
