import 'package:flutter/material.dart';

/// AnimatedBuilder正是将渲染逻辑分离出来
class AnimationBuilderRoute extends StatefulWidget {
  @override
  _AnimationBuilderRouteState createState() => new _AnimationBuilderRouteState();
}

/// 需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _AnimationBuilderRouteState extends State<AnimationBuilderRoute> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward(); // 启动动画，正向启动
      }
    });
    controller.forward(); // 启动动画，正向启动
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScaleAnimation'),
      ),
      body: Center(
        // AnimatedBuilder不仅可以从动画中分离出widget，也能把渲染过程抽象出来
        child: AnimatedBuilder(
          animation: animation,
          child: Image.asset('./images/flower.jpg'),
          builder: (BuildContext ctx, Widget child) {
            return Center(
              child: Container(
                height: animation.value,
                width: animation.value,
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose(); // 路由销毁时需要释放动画资源
    super.dispose();
  }
}

/// Flutter中正是通过这种方式封装了很多动画，如：FadeTransition、ScaleTransition、
/// SizeTransition、FractionalTranslation等，很多时候都可以复用这些预置的过渡类。
class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        child: child,
        animation: animation,
        builder: (BuildContext ctx, Widget child) {
          return Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
      ),
    );
  }
}
