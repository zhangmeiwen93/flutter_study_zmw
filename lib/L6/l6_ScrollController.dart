import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollControllerTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ScrollControllerTestRouteState();
  }
}

class ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动控制"),
      ),
      body: Scrollbar(
        child: ListView.builder(
            itemCount: 100,
            itemExtent: 50.0,
            controller: _controller,
            itemBuilder: (context, item) {
              return ListTile(
                title: Text("$item"),
              );
            }),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(0,
                    duration: Duration(microseconds: 200), curve: Curves.ease);
              }),
    );
  }
}

class ScrollNotificationTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ScrollNotificationTestRouteState();
  }
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: NotificationListener<ScrollNotification>(
      // ignore: missing_return
      onNotification: (ScrollNotification notification) {
        double progress =
            //当前滚动位置/最大可滚动长度。
            notification.metrics.pixels / notification.metrics.maxScrollExtent;
        setState(() {
          _progress = "${(progress * 100).toInt()}%";
        });
        print("BottomEdge: ${notification.metrics.extentAfter == 0}");
        //return true;
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ListView.builder(
              itemCount: 100,
              itemExtent: 50,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("$index"),
                );
              }),
          CircleAvatar(
            radius: 30.0,
            child: Text(_progress),
            backgroundColor: Colors.black54,
          )
        ],
      ),
    ));
  }
}
