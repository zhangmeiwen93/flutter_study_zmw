import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class L5_2_Box extends StatelessWidget {

  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.green),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return ConstrainedBox(
//      constraints: BoxConstraints(minWidth: double.infinity, minHeight: 50.0),
//      child: Container(height: 5.0, child: redBox),
//    );

      return SizedBox(
        width: 80,
        height: 80,
        child: redBox,
      );
  }
}
