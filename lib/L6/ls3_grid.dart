import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ls3_grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//      return GridView(
////      该子类实现了一个横轴为固定数量子元素的layout算法
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//          crossAxisCount: 3,
//          childAspectRatio: 1.0
//        ),
//        children: <Widget>[
//          Icon(Icons.ac_unit),
//          Icon(Icons.ac_unit),
//          Icon(Icons.ac_unit),
//          Icon(Icons.ac_unit),
//        ],
//      );

    //省略版本
//    return GridView.count(
//      crossAxisCount: 3,
//      childAspectRatio: 1.0,
//      children: <Widget>[
//        Icon(Icons.insert_comment),
//        Icon(Icons.insert_comment),
//        Icon(Icons.insert_comment),
//        Icon(Icons.insert_comment),
//        Icon(Icons.insert_comment),
//      ],
//    );

//    return GridView(
//      padding: EdgeInsets.zero,
//      //该子类实现了一个横轴子元素为固定最大长度的layout算法
//      gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
//        maxCrossAxisExtent: 120.0,
//        childAspectRatio: 2.0
//      ),
//      children: <Widget>[
//        Icon(Icons.ac_unit)
//      ],
//    );

    return GridView.extent(
      maxCrossAxisExtent: 100,
      childAspectRatio: 2.0,
      children: [Icon(Icons.invert_colors_on_sharp)],
    );
  }
}

class ls3_gridBuild extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => new _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<ls3_gridBuild> {
  List<IconData> _icons = []; //保存Icon数据

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1.0),
      itemCount: _icons.length,
      itemBuilder: (context, index) {
        //如果显示到最后一个并且Icon总数小于200时继续获取数据
        if (index == _icons.length - 1 && _icons.length < 200) {
          _retrieveIcons();
        }
        return Icon(_icons[index]);
      },
    );
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}
