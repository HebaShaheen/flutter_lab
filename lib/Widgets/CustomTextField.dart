import 'package:flutter/material.dart';
import '../Helpers/colors.dart';

class CustomTextField extends StatelessWidget {
  final String? text;
  final TextEditingController? controller;
  final Color? color;
  final Color? inputcolor;
  final VoidCallback? function;
  CustomTextField({
    this.text,
    this.inputcolor=Colors.black,
    this.color,
    this.controller,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white),
      child: TextField(
        controller: controller,
        cursorColor: colors.primarycolor,
        style: TextStyle(color: inputcolor),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
            hintStyle: TextStyle(color: color, fontSize: 12)),
      ),
    );
  }
}
