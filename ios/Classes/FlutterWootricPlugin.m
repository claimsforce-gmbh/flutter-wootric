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
  } else if ([@"showWootricSurvey" isEqualToString:call.method]) {
    NSString *clientId = call.arguments[@"clientId"];
    NSString *accountToken = call.arguments[@"accountToken"];
    NSString *email = call.arguments[@"email"];
    NSString *userId = call.arguments[@"userId"];
    NSDictionary *properties = call.arguments[@"properties"];
    UIViewController *rootController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [Wootric configureWithClientID:clientId accountToken: accountToken];
    if([email length] > 0) {
      [Wootric setEndUserEmail: email];
      if([userId length] > 0) {
        [Wootric setEndUserExternalId: userId];
      }
    } else if([userId length] > 0) {
      [Wootric setEndUserExternalId: userId];
      if([email length] == 0) {
        [Wootric setEndUserEmail: userId];
      }
    }
    [Wootric setEndUserProperties: properties];
    [Wootric forceSurvey:YES];
    [Wootric surveyImmediately: YES];
    [Wootric showSurveyInViewController:rootController];
  }
}

@end
