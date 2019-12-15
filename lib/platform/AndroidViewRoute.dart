import 'package:flutter/material.dart';

class AndroidViewRoute extends StatefulWidget {
  @override
  _AndroidViewRouteState createState() => _AndroidViewRouteState();
}

class _AndroidViewRouteState extends State<AndroidViewRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('android_view'),
      ),
      body: Container(
        child: AndroidView(viewType: "android_view"),
      ),
    );
  }
}
