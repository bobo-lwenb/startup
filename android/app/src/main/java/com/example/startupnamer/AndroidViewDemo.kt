package com.example.startupnamer

import android.content.Context
import android.view.View
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class AndroidViewDemo(codec: MessageCodec<Any>, val viewP: View) : PlatformViewFactory(codec) {
    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView = object : PlatformView {
        override fun getView(): View = viewP

        override fun dispose() {
        }
    }
}