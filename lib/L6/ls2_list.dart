import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//class ls2_list extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    Widget widget1 = Divider(
//      color: Colors.blue,
//    );
//    Widget widget2 = Divider(
//      color: Colors.blue,
//    );
//    return ListView.separated(
//      itemCount: 100,
////        itemExtent: 50.0,
//      itemBuilder: (BuildContext context, int index) {
//        return ListTile(
//          title: Text("index"),
//        );
//      },
//      separatorBuilder: (BuildContext context, int index) {
//        return index % 2 == 0 ? widget1 : widget2;
//      },
//    );
//  }
//
////适用于较少数据的情况
////  @override
////  Widget build(BuildContext context) {
////      return ListView(
////        shrinkWrap: false,
////        padding: EdgeInsets.all(20.0),
////        children: <Widget>[
////          const Text('I\'m dedicating every day to you'),
////          const Text('Domestic life was never quite my style'),
////          const Text('When you smile, you knock me out, I fall apart'),
////          const Text('And I thought I was so smart'),
////        ],
////      );
////  }
//
//}

class ls2_list extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<ls2_list> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
        itemBuilder: (context, index) {
          if (_words[index] == loadingTag) {
            if (_words.length - 1 < 100) {
              //获取数据
              _retrieveData();
              return Container(
                padding: const EdgeInsets.all(16.0),
                // ignore: missing_return
                alignment: Alignment.center,
                child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0)),
              );
            } else {
              //已经加载了100条数据，不再获取数据。
              return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "没有更多了",
                    style: TextStyle(color: Colors.grey),
                  ));
            }
          }
          return ListTile(
              title: Text(
            _words[index],
          ));
        },
        separatorBuilder: (context, index) => Divider(height: .0),
        itemCount: 100);
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(
            _words.length - 1,
            //每次生成20个单词
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }
}
