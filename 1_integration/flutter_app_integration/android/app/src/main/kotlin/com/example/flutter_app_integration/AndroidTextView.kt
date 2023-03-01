package com.example.flutter_app_integration

import android.content.Context
import android.graphics.Color
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
        textView.setBackgroundColor(Color.rgb(0, 240, 0))
        textView.text = "Нет сообщений"
    }
}