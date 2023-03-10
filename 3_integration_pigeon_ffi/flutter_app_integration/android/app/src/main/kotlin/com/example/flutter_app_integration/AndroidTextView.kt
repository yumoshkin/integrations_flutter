package com.example.flutter_app_integration

import android.content.Context
import android.view.View
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView

class AndroidTextView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
  private val textView: TextView

  override fun getView(): View {
    return textView
  }

  override fun dispose() {}

  init {
    textView = TextView(context)
    textView.textSize = 20f

    if (creationParams != null && creationParams["text"] != null) {
      textView.text = "${creationParams["text"]}"
    } else {
      textView.text = "Нет сообщений"
    }
  }
}