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
    //channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_wootric");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_wootric");
    //channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    }
    else if (call.method.equals("configure")) {
      String clientId = call.argument("clientId");
      String accountToken = call.argument("accountToken");
      wootric = Wootric.init(context, clientId, accountToken);
    }
    else if (call.method.equals("setEndUserEmail")) {
      String endUserEmail = call.argument("endUserEmail");
      wootric.setEndUserEmail(endUserEmail);
    }
    else if (call.method.equals("setEndUserExternalId")) {
      String endUserExternalId = call.argument("endUserExternalId");
      wootric.setEndUserExternalId(endUserExternalId);
    }
    else if (call.method.equals("setEndUserProperties")) {
      wootric.setProperties((HashMap<String, String>) call.argument("endUserProperties"));
    }
    else if (call.method.equals("surveyImmediately")) {
      boolean surveyImmediately = call.argument("surveyImmediately");
      wootric.setSurveyImmediately(surveyImmediately);
    }
    else if (call.method.equals("forceSurvey")) {
      boolean forceSurvey = call.argument("forceSurvey");
      wootric.setSurveyImmediately(forceSurvey);
    }
    else if (call.method.equals("setEndUserCreatedAt")) {
      int endUserCreatedAt = call.argument("endUserCreatedAt");
      wootric.setEndUserCreatedAt(endUserCreatedAt);
    }
    else if (call.method.equals("setFirstSurveyAfter")) {
      int numberOfDays = call.argument("numberOfDays");
      wootric.setFirstSurveyDelay(numberOfDays);
    }
    else if (call.method.equals("passScoreAndTextToURL")) {
      boolean passScoreAndTextToURL = call.argument("passScoreAndTextToURL");
      WootricCustomThankYou customThankYou = new WootricCustomThankYou();
      customThankYou.setScoreInUrl(passScoreAndTextToURL);
      customThankYou.setCommentInUrl(passScoreAndTextToURL);
      wootric.setCustomThankYou(customThankYou);
    }
    else if (call.method.equals("showOptOut")) {
      boolean showOptOut = call.argument("showOptOut");
      wootric.setShowOptOut(showOptOut);
    }
    else if (call.method.equals("skipFeedbackScreenForPromoter")) {
      boolean skipFeedbackScreenForPromoter = call.argument("skipFeedbackScreenForPromoter");
      wootric.shouldSkipFollowupScreenForPromoters(skipFeedbackScreenForPromoter);
    }
    else if (call.method.equals("setLanguageCode")) {
      String languageCode = call.argument("languageCode");
      wootric.setLanguageCode(languageCode);
    }
    else if (call.method.equals("showWootricSurvey")) {
      wootric.survey();
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
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    channel.setMethodCallHandler(null);
  }
}
