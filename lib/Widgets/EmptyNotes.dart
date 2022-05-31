import 'package:flutter/material.dart';
import '../Widgets/CustomText.dart';

import '../Helpers/colors.dart';

class EmptyNotes extends StatelessWidget {
  const EmptyNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: size.height * 0.28,
          width: size.width * 0.95,
          child: Image.asset(
            'assets/list.png',
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        CustomText(
          title: "No Notes",
          size: 20,
        ),
        SizedBox(
          height: 10,
        ),
        CustomText(
          title: "You have no task to do",
          size: 15,
        ),
      ],
    );
  }
}
