import 'package:flutter/material.dart';
import 'package:mari/Screens/Welcome/Welcom.dart';
import 'package:mari/constant.dart';

import 'package:statusbar/statusbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    StatusBar.color(Colors.grey);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Athu',
      theme: ThemeData(
        primaryColor: kPrimarycolor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Welcome(),
    );
  }
}
