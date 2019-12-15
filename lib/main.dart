import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:startup_namer/animation/ScaleAnimationTestRoute.dart';
import 'package:startup_namer/animation/StaggerTestRoute.dart';
import 'package:startup_namer/animation/demo/AnimatedBuilderRoute.dart';
import 'package:startup_namer/animation/demo/AnimatedWidgetRoute.dart';
import 'package:startup_namer/animation/route/custom/HeroAnimation.dart';
import 'package:startup_namer/animation/route/standard/HeroAnimationRoute.dart';
import 'package:startup_namer/customwidgets/GradientButtonRoute.dart';
import 'package:startup_namer/customwidgets/GradientCircularProgressRoute.dart';
import 'package:startup_namer/customwidgets/TurnBoxTestRoute.dart';
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
import 'package:startup_namer/localizations/custom/DemoLocalizationsDelegate.dart';
import 'package:startup_namer/notification/NotificationRoute.dart';
import 'package:startup_namer/platform/AndroidViewRoute.dart';
import 'package:startup_namer/platform/PlatFormRoute.dart';
import 'package:startup_namer/progressindicator/ProgressIndicatorRoute.dart';
import 'package:startup_namer/provider_shopping_cart//ProviderRoute.dart';
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
import 'package:startup_namer/tabmain/MainTab.dart';
import 'package:startup_namer/textfeild/loggin.dart';
import 'package:startup_namer/union/DemoLayoutRoute.dart';
import 'package:startup_namer/union/Flex_Expanded.dart';
import 'package:startup_namer/web/webview_flutter.dart';

import 'animation/BaseAnimationRoute.dart';
import 'demo/TakePicturesRoute.dart';

void main() {
  debugPaintSizeEnabled = false;

  debugPrint('start running');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      localizationsDelegates: [
        // 本地化的代理
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // 注册我们的代理类
        DemoLocalizationsDelegate(),
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('zh', "CN"),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:MainTab(),
      routes: <String, WidgetBuilder>{
        'Loggin': (BuildContext context) => new LogginRoute(),
        'ScaffoldDemo': (BuildContext context) => new ScaffoldDemo(),
        'SingleChildScrollView': (BuildContext context) => new SingleChildScrollViewTestRoute(),
        'ListView': (BuildContext context) => new ListViewTestRoute(),
        'ListView.custom': (BuildContext context) => new MyListView(),
        'GridView': (BuildContext context) => new GridViewRoute(),
        'IndicatorRoute': (BuildContext context) => new IndicatorRoute(),
        'ExpansionTile': (BuildContext context) => new ExpansionTileRoute(),
        'InfiniteListView': (BuildContext context) => new InfiniteListView(),
        'CustomScrollViewRoute': (BuildContext context) => CustomScrollViewRoute(),
        'ScrollControllerTestRoute': (BuildContext context) => ScrollControllerTestRoute(),
        'ScrollNotificationTestRoute': (BuildContext context) => ScrollNotificationTestRoute(),
        'WillPopScopeTestRoute': (BuildContext context) => WillPopScopeTestRoute(),
        'InheritedWidgetTestRoute': (BuildContext context) => InheritedWidgetTestRoute(),
        'ProviderRoute': (BuildContext context) => ProviderRoute(),
        'ThemeTestRoute': (BuildContext context) => ThemeTestRoute(),
        'PointerEventTestRoute': (BuildContext context) => PointerEventTestRoute(),
        'GestureDetectorTestRoute': (BuildContext context) => GestureDetectorTestRoute(),
        'DragTestRoute': (BuildContext context) => DragTestRoute(),
        'ScaleTestRoute': (BuildContext context) => ScaleTestRoute(),
        'GestureRecognizerTestRoute': (BuildContext context) => GestureRecognizerTestRoute(),
        'NotificationRoute': (BuildContext context) => NotificationRoute(),
        'BaseAnimationRoute': (BuildContext context) => BaseAnimationRoute(),
        'AnimatedWidgetRoute': (BuildContext context) => AnimatedWidgetTestRoute(),
        'AnimationBuilderRoute': (BuildContext context) => AnimationBuilderRoute(),
        'ScaleAnimation': (BuildContext context) => ScaleAnimation(),
        'HeroAnimationRoute': (BuildContext context) => HeroAnimationRoute(),
        'HeroAnimation': (BuildContext context) => RadialExpansionDemo(),
        'StaggerTestRoute': (BuildContext context) => StaggerTestRoute(),
        'GradientButtonRoute': (BuildContext context) => GradientButtonRoute(),
        'TurnBoxTestRoute': (BuildContext context) => TurnBoxTestRoute(),
        'CustomPaintRoute': (BuildContext context) => CustomPaintRoute(),
        'GradientCircularProgressRoute': (BuildContext context) => GradientCircularProgressRoute(),
        'HttpTestRoute': (BuildContext context) => HttpTestRoute(),
        'WebSocketRoute': (BuildContext context) => WebSocketRoute(),
        'PlatFormRoute': (BuildContext context) => PlatFormRoute(),
        'DismissableRoute': (BuildContext context) => DismissableRoute(),
        'DemoLayoutRoute': (BuildContext context) => DemoLayoutRoute(),
        'Flex_Expanded': (BuildContext context) => FlexAndExpanded(),
        'StateLifecycle': (BuildContext context) => StateLifecycle(),
        'WidgetsBindingRoute': (BuildContext context) => WidgetsBindingRoute(),
        'TakePic': (BuildContext context) => TakePictureRoute(),
        'Dialog': (BuildContext context) => DialogTestRoute(),
        'DialogState': (BuildContext context) => DialogStateRoute(),
        'HttpPage': (BuildContext context) => HttpPage(),
        'webview_flutter': (BuildContext context) => WebViewFlutter(),
        'android_view': (BuildContext context) => AndroidViewRoute(),
      },
      // 当push一个不存在的路由时会执行此操作
      onUnknownRoute: (RouteSettings settings) {
        return null;
      },
    );
  }
}
