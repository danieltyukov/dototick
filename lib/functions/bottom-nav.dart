import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dototick/constants/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bottomnav(BuildContext context) {
  return CurvedNavigationBar(
    backgroundColor: MyConstants.darkgrey,
    height: 55,
    color: MyConstants.verydarkgrey,
    items: <Widget>[
      Icon(Icons.add, size: 30, color: Colors.white),
      Icon(Icons.list, size: 30, color: Colors.white),
    ],
    onTap: (index) {
      //Handle button tap
    },
  );
}
