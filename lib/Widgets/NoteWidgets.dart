import 'dart:math';
import 'package:flutter/material.dart';
import '../Widgets/CustomText.dart';
import '../Helpers/colors.dart';

class NoteWidgets extends StatelessWidget {
  late Map<String, dynamic>? data;
  NoteWidgets({this.data});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.12,
      width: size.width * 0.90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: size.height * 0.12,
            width: size.width * 0.015,
            decoration: BoxDecoration(
                color: Color(data!['color']),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            children: [
              CustomText(
                title: data!['addres'],
                size: 18,
                color: colors.primarycolor,
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(title: data!['content'], size: 13),
            ],
          )
        ],
      ),
    );
  }
}
