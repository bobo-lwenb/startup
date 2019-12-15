import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRecognizerTestRoute extends StatefulWidget {
  @override
  _GestureRecognizerTestRouteState createState() => new _GestureRecognizerTestRouteState();
}

class _GestureRecognizerTestRouteState extends State<GestureRecognizerTestRoute> {
  TapGestureRecognizer _recognizer = new TapGestureRecognizer();
  bool _toggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureRecognizer'),
      ),
      body: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: '你好世界'),
              TextSpan(
                  text: '点我变色',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: _toggle ? Colors.blue : Colors.red,
                  ),
                  recognizer: _recognizer
                    ..onTap = () {
                      setState(() {
                        _toggle = !_toggle;
                      });
                    }),
              TextSpan(text: '你好世界'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _recognizer.dispose();
    super.dispose();
  }
}
