import 'package:flutter/material.dart';

import '../NAVBAR/navbar.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  Future Delay() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.push(context, MaterialPageRoute(builder: (context) => MainNav()));
  }
  @override
  void initState() {
    super.initState();
    Delay();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00b290),
      body: Center(
        child:Image.asset("images/toters.jpg"),
      ),
    );
  }
}
