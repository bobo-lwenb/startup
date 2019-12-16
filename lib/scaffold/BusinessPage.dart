import 'package:flutter/material.dart';

class BusinessPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BusinessState();
}

class BusinessState extends State<BusinessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('商业功能'),
      ),
      body: Center(
        child: Text('商业功能'),
      ),
    );
  }
}
