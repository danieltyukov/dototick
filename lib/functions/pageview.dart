import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dototick/constants/constant.dart';
import 'package:dototick/screens/calendar.dart';
import 'package:dototick/screens/home.dart';
import 'package:dototick/screens/weekly.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  PageViewPage({Key key}) : super(key: key);

  @override
  _PageViewPageState createState() => _PageViewPageState();
}
class _PageViewPageState extends State<PageViewPage> {
  var _pageController = PageController(
    initialPage: 0,
    viewportFraction: 1.0,
  );
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Schedule Your Time",
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        backgroundColor: MyConstants.darkgrey,
        height: 56,
        color: MyConstants.verydarkgrey,
        onTap: (index) {
          setState(
            () {
              _currentIndex = index;
              _pageController.jumpToPage(
                index,
              );
            },
          );
        },
        items: <Widget>[
          Container(
            margin: EdgeInsets.all(8),
            child: Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: Icon(
              Icons.list,
              size: 30,
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: Icon(
              Icons.calendar_today,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: PageView(
        
        dragStartBehavior: DragStartBehavior.down,
        controller: _pageController,
        onPageChanged: (index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
        children: <Widget>[
          HomePage(),
          WeeklyPlan(),
          Calendar(),
        ],
      ),
    );
  }
}
