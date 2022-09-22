import 'package:flutter/material.dart';
import 'UI/NAVBAR/navbar.dart';
import 'UI/SPLASHSCREEN/splashscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashscreen(),
    );
  }
}

