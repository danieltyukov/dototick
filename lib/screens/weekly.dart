import 'package:dototick/constants/constant.dart';
import 'package:flutter/material.dart';

class WeeklyPlan extends StatefulWidget {
  WeeklyPlan({Key key}) : super(key: key);

  @override
  _WeeklyPlanState createState() => _WeeklyPlanState();
}

class _WeeklyPlanState extends State<WeeklyPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstants.darkgrey,
      body: Row(
        children: [
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.blue,
            child: Text("HELLO"),
          ),
          Container(
            color: Colors.blue,
            child: Text("HELLO"),
          ),
          Container(
            color: Colors.blue,
            child: Text("HELLO"),
          ),
          Container(
            color: Colors.blue,
            child: Text("HELLO"),
          ),
          Container(
            color: Colors.blue,
            child: Text("HELLO"),
          ),
          Container(
            color: Colors.blue,
            child: Text("HELLO"),
          ),
        ],
      ),
    );
  }
}
