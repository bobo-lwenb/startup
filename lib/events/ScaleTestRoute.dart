import 'package:flutter/material.dart';

class ScaleTestRoute extends StatefulWidget {
  @override
  _ScaleTestRouteState createState() => new _ScaleTestRouteState();
}

class _ScaleTestRouteState extends State<ScaleTestRoute> {
  var _imgWidth = 600.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ScaleTest'),
        ),
        body: Center(
          child: GestureDetector(
            child: Image(
              image: AssetImage('./images/flower.jpg'),
              width: _imgWidth,
              fit: BoxFit.fill,
            ),
            onScaleUpdate: (ScaleUpdateDetails e) {
              setState(() {
                _imgWidth = 200 * e.scale.clamp(0.5, 2.0);
              });
            },
          ),
        ),
      ),
    );
  }
}
