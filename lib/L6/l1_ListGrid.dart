import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class L6_1_ListGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    Scrollable({
//      this.axisDirection = AxisDirection.down,
//      this.controller,
//      this.physics,
//    });

//    Scrollbar(
//      child: SingleChildScrollView(
//        reverse: true,
//      ),
//    ),
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    return Scrollbar(child: SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: str
              .split("")
              .map((e) => Text(
                    e,
                    textScaleFactor: 2.0,
                  ))
              .toList(),
        ),
      ),
    ));
  }
}
