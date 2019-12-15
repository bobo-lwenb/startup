import 'package:flutter/material.dart';

class DragTestRoute extends StatefulWidget {
  @override
  _DragTestRouteState createState() => new _DragTestRouteState();
}

class _DragTestRouteState extends State<DragTestRoute> {
  double _top = 0.0; // 距离顶部偏移量
  double _left = 0.0; // 举例左侧偏移量
  double _verticalTop = 0.0;
  double _horizontalLeft = 200.0;
  double _leftC = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DragTest'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text('A'),
              ),
              //手指按下时会触发此回调
              onPanDown: (DragDownDetails e) {
                //打印手指按下的位置(相对于屏幕)
                print("用户手指按下：${e.globalPosition}");
              },
              onPanUpdate: (DragUpdateDetails e) {
                //用户手指滑动时，更新偏移，重新构建
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                //打印滑动结束时在x、y轴上的速度
                print(e.velocity);
              },
            ),
          ),
          Positioned(
            top: _verticalTop,
            left: _horizontalLeft,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("B"),
              ),
              onVerticalDragUpdate: (DragUpdateDetails e) {
                setState(() {
                  _verticalTop += e.delta.dy;
                });
              },
              onHorizontalDragUpdate: (DragUpdateDetails e) {
                setState(() {
                  _horizontalLeft += e.delta.dx;
                });
              },
            ),
          ),
          Positioned(
            top: 100.0,
            left: _leftC,
            child: Listener(
              onPointerDown: (PointerDownEvent e) {
                print('Down');
              },
              onPointerUp: (PointerUpEvent e) {
                print('Up');
              },
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text('C'),
                ),
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _leftC += details.delta.dx;
                  });
                },
                onHorizontalDragEnd: (DragEndDetails details) {
                  print('onHorizontalDragEnd');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
