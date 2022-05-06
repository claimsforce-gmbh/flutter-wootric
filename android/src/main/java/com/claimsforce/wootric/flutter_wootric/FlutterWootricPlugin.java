package com.claimsforce.wootric.flutter_wootric;

import android.app.Activity;
import androidx.annotation.NonNull;
import com.wootric.androidsdk.Wootric;
import com.wootric.androidsdk.objects.WootricCustomThankYou;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import java.util.HashMap;

/**
 * FlutterWootricPlugin
 */
public class FlutterWootricPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {

  private Activity context;
  private MethodChannel channel;
  private Wootric wootric;

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding flutterPluginBinding) {
    context = flutterPluginBinding.getActivity();
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_wootric");
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    switch (call.method) {
      case "getPlatformVersion":
        result.success("Android " + android.os.Build.VERSION.RELEASE);
        break;
      case "configure":
        String clientId = call.argument("clientId");
        String accountToken = call.argument("accountToken");
        if (clientId == null || accountToken == null) break;
        wootric = Wootric.init(context, clientId, accountToken);
        break;
      case "setEndUserEmail":
        String endUserEmail = call.argument("endUserEmail");
        if (endUserEmail == null) break;
        wootric.setEndUserEmail(endUserEmail);
        break;
      case "setEndUserExternalId":
        String endUserExternalId = call.argument("endUserExternalId");
        if (endUserExternalId == null) break;
        wootric.setEndUserExternalId(endUserExternalId);
        break;
      case "setEndUserProperties":
        HashMap<String, String> endUserProperties = call.argument("endUserProperties");
        if (endUserProperties == null) break;
        wootric.setProperties(endUserProperties);
        break;
      case "surveyImmediately":
        Boolean surveyImmediately = call.argument("surveyImmediately");
        if (surveyImmediately == null) break;
        wootric.setSurveyImmediately(surveyImmediately);
        break;
      case "forceSurvey":
        Boolean forceSurvey = call.argument("forceSurvey");
        if (forceSurvey == null) break;
        wootric.setSurveyImmediately(forceSurvey);
        break;
      case "setEndUserCreatedAt":
        Long endUserCreatedAt = call.argument("endUserCreatedAt");
        if (endUserCreatedAt == null) break;
        wootric.setEndUserCreatedAt(endUserCreatedAt);
        break;
      case "setFirstSurveyAfter":
        Integer numberOfDays = call.argument("numberOfDays");
        if (numberOfDays == null) break;
        wootric.setFirstSurveyDelay(numberOfDays);
        break;
      case "passScoreAndTextToURL":
        Boolean passScoreAndTextToURL = call.argument("passScoreAndTextToURL");
        if (passScoreAndTextToURL == null) break;
        WootricCustomThankYou customThankYou = new WootricCustomThankYou();
        customThankYou.setScoreInUrl(passScoreAndTextToURL);
        customThankYou.setCommentInUrl(passScoreAndTextToURL);
        wootric.setCustomThankYou(customThankYou);
        break;
      case "showOptOut":
        Boolean showOptOut = call.argument("showOptOut");
        if (showOptOut == null) break;
        wootric.setShowOptOut(showOptOut);
        break;
      case "skipFeedbackScreenForPromoter":
        Boolean skipFeedbackScreenForPromoter = call.argument("skipFeedbackScreenForPromoter");
        if (skipFeedbackScreenForPromoter == null) break;
        wootric.shouldSkipFollowupScreenForPromoters(skipFeedbackScreenForPromoter);
        break;
      case "setLanguageCode":
        String languageCode = call.argument("languageCode");
        if (languageCode == null) break;
        wootric.setLanguageCode(languageCode);
        break;
      case "showWootricSurvey":
        wootric.survey();
        break;
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onDetachedFromActivity() {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    channel.setMethodCallHandler(null);
  }
}
