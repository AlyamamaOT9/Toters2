import 'package:flutter/material.dart';

class orderpage extends StatefulWidget {
  const orderpage({Key? key}) : super(key: key);

  @override
  State<orderpage> createState() => _orderpageState();
}

class _orderpageState extends State<orderpage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Past Order",
                //  icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                text: "Upcoming",
                // icon: Icon(Icons.beach_access_sharp),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("You do not have any pat orders"),
            ),
            Center(
              child: Text("You do not have any pat orders"),
            ),
          ],
        ),
      ),
    );
  }
}

