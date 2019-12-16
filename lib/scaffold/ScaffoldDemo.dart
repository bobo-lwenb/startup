import 'package:flutter/material.dart';
import 'package:startup_namer/scaffold/BusinessPage.dart';
import 'package:startup_namer/scaffold/CategoryPage.dart';

class ScaffoldDemo extends StatefulWidget {
  @override
  _ScaffoldDemoState createState() => _ScaffoldDemoState();
}

class _ScaffoldDemoState extends State<ScaffoldDemo> with SingleTickerProviderStateMixin {
  PageController _controller;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          CategoryPage(),
          BusinessPage(),
        ],
        onPageChanged: (index) {
          _changeIconState(index);
        },
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Builder(builder: (ctx) {
          return Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.category,
                  color: _index == 0 ? Colors.blue : null,
                ),
                onPressed: () {
                  _changeIconState(0);
                },
              ),
              SizedBox(), //中间位置空出
              IconButton(
                icon: Icon(
                  Icons.business,
                  color: _index == 1 ? Colors.blue : null,
                ),
                onPressed: () {
                  _changeIconState(1);
                },
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _changeIconState(int index) {
    _controller.jumpToPage(index);
    setState(() {
      _index = index;
    });
  }

  void _onAdd() {}
}
