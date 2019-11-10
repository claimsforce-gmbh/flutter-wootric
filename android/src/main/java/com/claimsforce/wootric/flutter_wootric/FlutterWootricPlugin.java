package com.claimsforce.wootric.flutter_wootric;
import android.app.Activity;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import com.wootric.androidsdk.Wootric;
import com.wootric.androidsdk.objects.WootricCustomMessage;
import com.wootric.androidsdk.objects.WootricCustomThankYou;

import java.util.HashMap;

/** FlutterWootricPlugin */
public class FlutterWootricPlugin implements MethodCallHandler {
  Activity context;
  MethodChannel methodChannel;
  Wootric wootric;

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_wootric");
    channel.setMethodCallHandler(new FlutterWootricPlugin(registrar.activity(), channel));
  }

  public FlutterWootricPlugin(Activity activity, MethodChannel methodChannel) {
    this.context = activity;
    this.methodChannel = methodChannel;
    this.methodChannel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if(call.method.equals("configure")) {
      String clientId = call.argument("clientId");
      String accountToken = call.argument("accountToken");
      wootric = Wootric.init(context, clientId, accountToken);
    } else if(call.method.equals("setEndUserEmail")) {
      String endUserEmail = call.argument("endUserEmail");
      wootric.setEndUserEmail(endUserEmail);
    } else if(call.method.equals("setEndUserExternalId")) {
      String endUserExternalId = call.argument("endUserExternalId");
      wootric.setEndUserExternalId(endUserExternalId);
    } else if(call.method.equals("setEndUserProperties")) {
      wootric.setProperties((HashMap<String,String>) call.argument("endUserProperties"));
    } else if(call.method.equals("surveyImmediately")) {
      boolean surveyImmediately = call.argument("surveyImmediately");
      wootric.setSurveyImmediately(surveyImmediately);
    } else if(call.method.equals("forceSurvey")) {
      boolean forceSurvey = call.argument("forceSurvey");
      wootric.setSurveyImmediately(forceSurvey);
    } else if(call.method.equals("setEndUserCreatedAt")) {
      long endUserCreatedAt = call.argument("endUserCreatedAt");
      wootric.setEndUserCreatedAt(endUserCreatedAt);
    } else if(call.method.equals("setFirstSurveyAfter")) {
      int numberOfDays = call.argument("numberOfDays");
      wootric.setFirstSurveyDelay(numberOfDays);
    } else if(call.method.equals("passScoreAndTextToURL")) {
      boolean passScoreAndTextToURL = call.argument("passScoreAndTextToURL");
      WootricCustomThankYou customThankYou = new WootricCustomThankYou();
      customThankYou.setScoreInUrl(passScoreAndTextToURL);
      customThankYou.setCommentInUrl(passScoreAndTextToURL);
      wootric.setCustomThankYou(customThankYou);
    } else if(call.method.equals("showOptOut")) {
      boolean showOptOut = call.argument("showOptOut");
      wootric.setShowOptOut(showOptOut);
    } else if(call.method.equals("skipFeedbackScreenForPromoter")) {
      boolean skipFeedbackScreenForPromoter = call.argument("skipFeedbackScreenForPromoter");
      wootric.shouldSkipFollowupScreenForPromoters(skipFeedbackScreenForPromoter);
    } else if(call.method.equals("setLanguageCode")) {
      String languageCode = call.argument("languageCode");
      wootric.setLanguageCode(languageCode);
    } else if(call.method.equals("showWootricSurvey")) {
      wootric.survey();
    }
  }

}
