import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapboxA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void setActive() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: setActive,
      child: new Container(
        child: new Center(
          child: new Text.rich(TextSpan(
              children: [
                TextSpan(
                    text: "Home: "
                ),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(
                    color: Colors.yellow
                  ),
//                  recognizer: _tapRecognizer，它是点击链接后的一个处理器
                ),
              ]
            )
          ),
        ),
        width: 200,
        height: 300,
        decoration: new BoxDecoration(
            color: _active? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
