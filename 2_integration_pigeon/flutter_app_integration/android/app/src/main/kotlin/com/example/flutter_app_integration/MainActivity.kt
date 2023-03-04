package com.example.flutter_app_integration

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.Pigeon

class MainActivity: FlutterActivity() {
  private class MyMessageApi: Pigeon.MessageApi {
    override fun getMessage(text: String): String {
      return text
    }
  }

  private val androidViewId = "INTEGRATION_ANDROID"

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)

    flutterEngine
      .platformViewsController
      .registry
      .registerViewFactory(androidViewId, AndroidTextViewFactory())

    Pigeon.MessageApi.setup(flutterEngine.dartExecutor.binaryMessenger, MyMessageApi())
  }
}
