import 'package:flutter/material.dart';
import 'package:scene/screens/login.dart';
import 'package:scene/screens/show_report.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scene',
      // home: BHLoginScreen()
      home: HomeScreen(),
    );
  }
}
