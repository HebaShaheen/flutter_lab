import 'package:flutter/material.dart';
import '../../Helpers/colors.dart';
import '../../Helpers/data.dart';
import '../../Widgets/ButtonWidgets.dart';
import '../Home/Home.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(size.height*0.08),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: size.height * 0.50,
              width: size.width * 0.95,
              child: Image.asset(
                'assets/note1.png',
                color: colors.primarycolor,
              ),
            ),
            Container(
              height: size.height*0.07,
              width: size.width*0.70,
              child: ButtonWidgets(
                color: colors.primarycolor,
                borderRadius: 10,
                title: 'Get Started',
                onpress: () async {
                  data.setData("welcome", "true");
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Home()),
                      (Route<dynamic> route) => false);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
