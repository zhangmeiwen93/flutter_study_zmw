import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//测试父布局管理子布局
class TapboxB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class TapboxBState extends StatelessWidget {
  TapboxBState({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? "正确" : "错误",
            style: new TextStyle(color: Colors.yellow,fontSize: 32.0),
          ),
        ),
        width: 300,
        height: 300,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
