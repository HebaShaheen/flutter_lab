import 'package:flutter/cupertino.dart';

class MyColors {
  factory MyColors() {
    return _colors;
  }

  MyColors._internal(); //name of constructor
  Color primarycolor = Color(0xFF1321E0);
  List<int> Colorlist = [
    0xF28B81,
    0xFFCBF0F8,
    0xFFBF476,
    0xFF7BD02,
    0xFF28B81,
    0xFFCDFF90,
    0xFFAFCBFA,
    0xFFD7AEFC,
    0xFFFBCFE9,
    0xFFE6C9A9,
    0xFFE9EAEE
  ];
  static final MyColors _colors = MyColors._internal();
}

final MyColors colors = MyColors();
