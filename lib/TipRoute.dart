import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


/// 测试传递参数 路由传值
class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text, // 接收一个text参数
    this.backgroundColor = Colors.grey
  }) : super(key: key);

  final String text;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("测试跳转"),
      ),
      body: Padding(

        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
