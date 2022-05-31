import 'package:flutter/material.dart';
import 'Helpers/colors.dart';
import 'Helpers/data.dart';
import 'Views/Splash/SplashSrceen.dart';
import 'Views/Welcome/Welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget? defaultPage =
      await data.getData('welcome') != '' ? SplashScreen() : Welcome();
  runApp(MyApp(defaultPage));
}

class MyApp extends StatelessWidget {
  Widget? defaultPage;
  MyApp(this.defaultPage);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primaryColor: colors.primarycolor,
      ),
      home: defaultPage,
    );
  }
}
