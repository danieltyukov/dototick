import 'package:dototick/constants/constant.dart';
import 'package:dototick/functions/bottom-nav.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyConstants.darkgrey,
        bottomNavigationBar: bottomnav(context),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Today Schedule",
            textAlign: TextAlign.center,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyConstants.lightgrey,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {},
        ),
        body: Column());
  }
}
