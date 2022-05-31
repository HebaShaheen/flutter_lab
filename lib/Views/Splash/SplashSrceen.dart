import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
//import '../../Widgets/CustomText.dart';
//import '../../Helpers/colors.dart';
import '../Home/Home.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note App'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          Spacer(flex: 2),
          Container(
            width: double.infinity,
            height: 200,
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.fill,
            ),
          ),
          Spacer(flex: 4),
          ElevatedButton(
            child: const Text('Get Start'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(300, 60),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
          Spacer(flex: 4),
        ]),
      ),
    );
  }
}
      // body: Padding(
      //   padding: const EdgeInsets.only(bottom: 10, top: 15),
      //   child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Center(
      //           child: Container(
      //             height: size.height * 0.65,
      //             width: size.width * 0.95,
      //             child: Image.asset(
      //               'assets/note1.png',
      //               color: colors.primarycolor,
      //             ),
      //           ),
      //         ),
      //         Container(
      //             height: size.height * 0.17,
      //             width: size.width * 0.15,
      //             child: CustomText(
      //               fontWeight: FontWeight.bold,
      //               size: 18,
      //               title: "Note App",
      //             )),
      //       ]),
      // ),
    