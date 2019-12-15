import 'package:flutter/material.dart';

class MineTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MineTebState();
}

class MineTebState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (ctx, index) {
          return Container(
            height: 40,
            child: Center(
              child: Text('MindeTab'),
            ),
          );
        },
      ),
    );
  }
}
