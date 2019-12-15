package com.example.startupnamer

import android.annotation.TargetApi
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.graphics.Color
import android.os.BatteryManager
import android.os.Build
import android.os.Bundle
import android.view.Gravity
import android.view.ViewGroup
import android.widget.LinearLayout
import android.widget.TextView
import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import android.widget.Toast
import io.flutter.plugin.common.*


class MainActivity : FlutterActivity() {

    private val CHANNEL = "samples.flutter.io/battery"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        registerAndroidView()

        /**
         * BasicMessageChannel接收flutter的消息
         */
        BasicMessageChannel(flutterView, "flutter_and_native_100", StandardMessageCodec.INSTANCE).setMessageHandler { message, reply ->
            val arguments: Map<String, String> = message as Map<String, String>
            when (arguments["method"]) {
                "test" -> {
                    Toast.makeText(this, "test", Toast.LENGTH_SHORT).show()
                    val map = mapOf("message" to "reply.reply 返回给flutter的数据", "code" to 200)
                    reply.reply(map)
                }
                else -> {

                }
            }
        }

        /**
         * BasicMessageChannel主动向flutter发送消息
         */
        val map = mapOf("message" to "android 主动调用 flutter test 方法", "code" to 200)
        BasicMessageChannel(flutterView, "flutter_and_native_100", StandardMessageCodec.INSTANCE).send(map) { reply ->
            println(reply)
        }

        /**
         * MethodChannel接收flutter的消息
         */
        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { methodCall, result ->
            if (methodCall.method == "getBatteryLevel") {
                val batteryLevel = getBatteryLevel()
                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }

        /**
         * MethodChannel主动向flutter发送消息
         */
        MethodChannel(flutterView, "").invokeMethod("getContent", "arguments", object : MethodChannel.Result {

            override fun success(result: Any?) {

            }

            override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {

            }

            override fun notImplemented() {

            }
        })

        /**
         * EventChannel只能向flutter发送消息
         */
        EventChannel(flutterView, "samples.flutter.io/EventChannel").setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {

            }

            override fun onCancel(arguments: Any?) {

            }
        })
    }

    private fun registerAndroidView() {
        val textView = TextView(this)
        val params = LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT)
        textView.layoutParams = params
        textView.setBackgroundColor(Color.RED)
        textView.gravity = Gravity.CENTER_HORIZONTAL
        textView.text = "Android View"

        val registry = registrarFor("111")
        registry.platformViewRegistry().registerViewFactory("android_view", AndroidViewDemo(StandardMessageCodec(), textView))
    }

    @TargetApi(Build.VERSION_CODES.ECLAIR)
    private fun getBatteryLevel(): Int {
        val batteryLevel: Int;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }
        return batteryLevel
    }
}
