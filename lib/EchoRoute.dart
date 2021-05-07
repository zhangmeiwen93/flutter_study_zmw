import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/// 测试命名路由，携带数据且返回数据
class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_statements
    //获取路由参数
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(onPressed: () {
              Navigator.pop(context,"测试命名路由返回值");
            }, child: Text("返回"))
          ],
        ),
      ),
    );
  }
}
