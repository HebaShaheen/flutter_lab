import 'package:flutter/material.dart';

class ButtonWidgets extends StatelessWidget {
  late VoidCallback? onpress;
  late String? title;
  late double? borderRadius;
  late Color? color;

  ButtonWidgets({this.color, this.title, this.onpress, this.borderRadius = 15});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
          ))),
      child: Text(
        title!,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      onPressed: onpress,
    );
  }
}
