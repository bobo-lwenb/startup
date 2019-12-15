import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startup_namer/animation/BaseAnimationRoute.dart';
import 'package:startup_namer/animation/ScaleAnimationTestRoute.dart';
import 'package:startup_namer/animation/StaggerTestRoute.dart';
import 'package:startup_namer/animation/demo/AnimatedBuilderRoute.dart';
import 'package:startup_namer/animation/demo/AnimatedWidgetRoute.dart';
import 'package:startup_namer/animation/route/FadeRoute.dart';
import 'package:startup_namer/animation/route/custom/HeroAnimation.dart';
import 'package:startup_namer/animation/route/standard/HeroAnimationRoute.dart';
import 'package:startup_namer/customwidgets/GradientButtonRoute.dart';
import 'package:startup_namer/customwidgets/GradientCircularProgressRoute.dart';
import 'package:startup_namer/customwidgets/TurnBoxTestRoute.dart';
import 'package:startup_namer/demo/TakePicturesRoute.dart';
import 'package:startup_namer/dialog/DialogStateRoute.dart';
import 'package:startup_namer/dialog/DialogTestRoute.dart';
import 'package:startup_namer/events/DragTestRoute.dart';
import 'package:startup_namer/events/GestureDetectorTestRoute.dart';
import 'package:startup_namer/events/GestureRecognizerTestRoute.dart';
import 'package:startup_namer/events/PointerEventTestRoute.dart';
import 'package:startup_namer/events/ScaleTestRoute.dart';
import 'package:startup_namer/funwiget/InheritedWidgetTestRoute.dart';
import 'package:startup_namer/funwiget/ThemeTestRoute.dart';
import 'package:startup_namer/funwiget/WillPopScopeTestRoute.dart';
import 'package:startup_namer/http/HttpTestRoute.dart';
import 'package:startup_namer/http/WebSocketRoute.dart';
import 'package:startup_namer/http/httpdemo/HttpPage.dart';
import 'package:startup_namer/lifecycle/StateLifecycleTest.dart';
import 'package:startup_namer/lifecycle/WidgetsBindingRoute.dart';
import 'package:startup_namer/localizations/custom/DemoLocalizations.dart';
import 'package:startup_namer/notification/NotificationRoute.dart';
import 'package:startup_namer/platform/AndroidViewRoute.dart';
import 'package:startup_namer/platform/PlatFormRoute.dart';
import 'package:startup_namer/progressindicator/ProgressIndicatorRoute.dart';
import 'package:startup_namer/provider_shopping_cart/ProviderRoute.dart';
import 'package:startup_namer/scaffold/ScaffoldDemo.dart';
import 'package:startup_namer/scroller/DismissableRoute.dart';
import 'package:startup_namer/scroller/ExpansionTileRoute.dart';
import 'package:startup_namer/scroller/GridViewRoute.dart';
import 'package:startup_namer/scroller/InfiniteListView.dart';
import 'package:startup_namer/scroller/ListViewCustomRoute.dart';
import 'package:startup_namer/scroller/ListViewTestRoute.dart';
import 'package:startup_namer/scroller/ScrollControllerTestRoute.dart';
import 'package:startup_namer/scroller/ScrollNotificationTestRoute.dart';
import 'package:startup_namer/scroller/SingleChildScrollViewRoute.dart';
import 'package:startup_namer/scroller/SliverRoute.dart';
import 'package:startup_namer/selfpainting/CustomPaintRoute.dart';
import 'package:startup_namer/setting/DemoSetting.dart';
import 'package:startup_namer/textfeild/loggin.dart';
import 'package:startup_namer/union/DemoLayoutRoute.dart';
import 'package:startup_namer/union/Flex_Expanded.dart';
import 'package:startup_namer/web/webview_flutter.dart';

class DemoTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DemoTabState();
}

class DemoTabState extends State<DemoTab> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('_MyHomePageState');
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.brightness_high),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return DemoSetting();
              }));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('You have pushed the button this many times:', style: TextStyle(fontSize: 18)),
                      Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _item(DemoLocalizations.of(context).titleRoute, LogginRoute(), 'Loggin'),
                  _item('Scaffold页面结构', ScaffoldDemo(), 'ScaffoldDemo'),
                  _item('SingleChildScrollView组件', SingleChildScrollViewTestRoute(), 'SingleChildScrollView'),
                  _item('ListView组件', ListViewTestRoute(), 'ListView'),
                  _item('ListView.custom组件', MyListView(), 'ListView.custom'),
                  _item('GridView组件演示上拉下拉刷新', GridViewRoute(), 'GridView'),
                  _item('进度指示器', IndicatorRoute(), 'IndicatorRoute'),
                  _item('ExpansionTile演示', ExpansionTileRoute(), 'ExpansionTile'),
                  _item('无限加载ListView', InfiniteListView(), 'InfiniteListView'),
                  _item('Sliver演示', CustomScrollViewRoute(), 'CustomScrollViewRoute'),
                  _item('ScrollController用法', ScrollControllerTestRoute(), 'ScrollControllerTestRoute'),
                  _item('ScrollNotification用法', ScrollNotificationTestRoute(), 'ScrollNotificationTestRoute'),
                  _item('Dismissible左右滑动操作', DismissableRoute(), 'DismissableRoute'),
                  _item('导航返回拦截WillPopScope', WillPopScopeTestRoute(), 'WillPopScopeTestRoute'),
                  _item('计数器的InheritedWidget实现', InheritedWidgetTestRoute(), 'InheritedWidgetTestRoute'),
                  _item('基本Provider实现购物车例子', ProviderRoute(), 'ProviderRoute'),
                  _item('Theme演示页面', ThemeTestRoute(), 'ThemeTestRoute'),
                  _item('原始指针事件PointerEvent', PointerEventTestRoute(), 'PointerEventTestRoute'),
                  _item('手势GestureDetector', GestureDetectorTestRoute(), 'GestureDetectorTestRoute'),
                  _item('拖动缩放事件', DragTestRoute(), 'DragTestRoute'),
                  _item('监听缩放事件', ScaleTestRoute(), 'ScaleTestRoute'),
                  _item('手势识别器', GestureRecognizerTestRoute(), 'GestureRecognizerTestRoute'),
                  _item('通知冒泡', NotificationRoute(), 'NotificationRoute'),
                  _item('动画的基本使用', BaseAnimationRoute(), 'BaseAnimationRoute'),
                  _item('AnimatedWidget简化', AnimatedWidgetTestRoute(), 'AnimatedWidgetRoute'),
                  _item('AnimationBuilder重构', AnimationBuilderRoute(), 'AnimationBuilderRoute'),
                  _item('ScaleAnimation示例', ScaleAnimation(), 'ScaleAnimation'),
                  _item('标准Hero动画', HeroAnimationRoute(), 'HeroAnimationRoute'),
                  _item('自定义Hero动画', RadialExpansionDemo(), 'HeroAnimation'),
                  _item('交错动画', StaggerTestRoute(), 'StaggerTestRoute'),
                  _item('按钮背景色渐变', GradientButtonRoute(), 'GradientButtonRoute'),
                  _item('旋转动画及自定义控件', TurnBoxTestRoute(), 'TurnBoxTestRoute'),
                  _item('自定义Paint', CustomPaintRoute(), 'CustomPaintRoute'),
                  _item('自定义圆形进度圈', GradientCircularProgressRoute(), 'GradientCircularProgressRoute'),
                  _item('Http简单使用', HttpPage(), 'HttpPage'),
                  _item('Http请求测试', HttpTestRoute(), 'HttpTestRoute'),
                  _item('WebSocket演示', WebSocketRoute(), 'WebSocketRoute'),
                  _item('MethodChannel演示', PlatFormRoute(), 'PlatFormRoute'),
                  _item('布局Demo', DemoLayoutRoute(), 'DemoLayoutRoute'),
                  _item('Flex和Expanded', FlexAndExpanded(), 'Flex_Expanded'),
                  _item('State生命周期', StateLifecycle(), 'StateLifecycle'),
                  _item('WidgetsBindingObserver', WidgetsBindingRoute(), 'WidgetsBindingRoute'),
                  _item('获取照片demo', TakePictureRoute(), 'TakePic'),
                  _item('常用对话框', DialogTestRoute(), 'Dialog'),
                  _item('状态对话框', DialogStateRoute(), 'DialogState'),
                  _item('webview_flutter示例', WebViewFlutter(), 'webview_flutter'),
                  _item('AndroidView简单使用', AndroidViewRoute(), 'android_view'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<File> _getLocalFile() async {
    // 获取应用目录
    String path = (await getApplicationDocumentsDirectory()).path;
    return File('$path/counter.txt');
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      String counts = await file.readAsString();
      return int.parse(counts);
    } on FileSystemException {
      return 0;
    }
  }

  void _incrementCounter() async {
    debugDumpSemanticsTree(DebugSemanticsDumpOrder.traversalOrder);
    setState(() {
      _counter++;
    });
    await (await _getLocalFile()).writeAsString('$_counter');
  }

  _item(String title, page, String routeName) {
    return FlatButton(
      child: new Text(title, style: TextStyle(fontSize: 18)),
      textColor: Colors.blue,
      onPressed: () {
        _getState().then((onValue) {
          if (onValue) {
            Navigator.pushNamed(
              context,
              routeName,
              arguments: 'aaaaaaa',
            );
          } else {
            if (routeName == 'HeroAnimationRoute') {
              Navigator.push(context, FadeRoute(builder: (context) => page));
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => page,
                  settings: RouteSettings(
                    arguments: "aaaa",
                  ),
                ),
              );
            }
          }
        });
      },
    );
  }

  Future<bool> _getState() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    return _sp.getBool('route_state');
  }
}
