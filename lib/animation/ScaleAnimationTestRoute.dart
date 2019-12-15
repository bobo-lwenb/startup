import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  @override
  _ScaleAnimationState createState() => new _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  double animationValue;
  AnimationStatus animationStatus;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          animationValue = animation.value;
        });
      })
      ..addStatusListener((AnimationStatus status) {
        setState(() {
          animationStatus = status;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('缩放动画demo'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                constraints: BoxConstraints.tightFor(width: 100, height: 30),
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(),
                child: Text(
                  '开始',
                ),
              ),
              onTap: () {
                controller.reset();
                controller.forward();
              },
            ),
            Text('State: ${animationStatus.toString()}'),
            Text('Value: $animationValue'),
            Container(
              height: animationValue,
              width: animationValue,
              child: FlutterLogo(),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
