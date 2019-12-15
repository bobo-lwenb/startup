package com.example.startupnamer;

import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.StandardMessageCodec;

public class demo extends FlutterActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        new BasicMessageChannel(getFlutterView(), "111", StandardMessageCodec.INSTANCE).send("123", reply -> {

        });

        new MethodChannel(getFlutterView(), "").invokeMethod("getContent", "arguments", new MethodChannel.Result() {

            @Override
            public void success(Object result) {

            }

            @Override
            public void error(String errorCode, String errorMessage, Object errorDetails) {

            }

            @Override
            public void notImplemented() {

            }
        });
    }
}
