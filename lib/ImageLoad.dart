import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageLoad extends StatelessWidget{

  const ImageLoad({
    Key key,
    @required this.text,
    this.backgroundColor:Colors.grey,
  }):super(key:key);

  final String text;
  final Color backgroundColor;



  @override
  Widget build(BuildContext context) {
    return new DecoratedBox(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('assets/images/ic_group_top.png'),
        ),
      ),
    );
    //加载
    return Center(
      child: Container(
        color:backgroundColor ,
        child: Text("用来测试的111"),
      ),
    );
  }
}