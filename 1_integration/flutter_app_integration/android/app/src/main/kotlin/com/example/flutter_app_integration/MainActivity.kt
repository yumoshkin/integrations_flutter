package com.example.flutter_app_integration

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.EventChannel

class MainActivity: FlutterActivity() {
    private val androidViewId = "INTEGRATION_ANDROID"
    private val eventsChannel = "CALL_EVENTS"
    private val methodChannelId = "CALL_METHOD"
    private val intentName = "EVENTS"
    private val intentMessageId = "sendMessage"

    private var receiver: BroadcastReceiver? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory(androidViewId, AndroidTextViewFactory())

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, methodChannelId).setMethodCallHandler {
                call, result ->
            if (call.method == intentMessageId) {
                val message = call.argument("message") ?: ""

                // передать message в AndroidTextView
                // ???

                result.success(message)


            } else {
                result.notImplemented()
            }
        }

        EventChannel(flutterEngine.dartExecutor, eventsChannel).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(args: Any?, events: EventChannel.EventSink) {
                    receiver = createReceiver(events)
                    applicationContext?.registerReceiver(receiver, IntentFilter(intentName))
                }

                override fun onCancel(args: Any?) {
                    receiver = null
                }
            }
        )
    }

    fun createReceiver(events: EventChannel.EventSink): BroadcastReceiver? {
        return  object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                events.success(intent.getIntExtra(intentMessageId, 0))
            }
        }
    }

}
