import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:startup_namer/tabmain/DemoTab.dart';
import 'package:startup_namer/tabmain/MineTab.dart';

List pages = <Widget>[DemoTab(), MineTab()];

class MainTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainTabState();
}

class MainTabState extends State<MainTab> {
  int _tabIndex = 0;
  var _controller = PageController(initialPage: 0);
  DateTime _lastPress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            _controller.jumpToPage(index);
            _tabIndex = index;
          });
        },
        selectedItemColor: Color(0xff333333),
        unselectedItemColor: Color(0xff999999),
        selectedFontSize: 11,
        unselectedFontSize: 11,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart, color: Color(0xff999999)),
            activeIcon: Icon(Icons.add_shopping_cart, color: Color(0xff333333)),
            title: Text('Demo'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.child_friendly, color: Color(0xff999999)),
            activeIcon: Icon(Icons.child_friendly, color: Color(0xff333333)),
            title: Text('Mine'),
          )
        ],
      ),
      body: WillPopScope(
        child: PageView.builder(
          itemBuilder: (ctx, index) {
            return pages[index];
          },
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
        ),
        onWillPop: () async {
          if (_lastPress == null || DateTime.now().difference(_lastPress) > Duration(seconds: 1)) {
            _lastPress = DateTime.now();
            Fluttertoast.showToast(msg: 'Press again to exit');
            return false;
          } else {
            return true;
          }
        },
      ),
    );
  }
}
