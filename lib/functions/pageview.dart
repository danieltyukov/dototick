import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dototick/constants/constant.dart';
import 'package:dototick/functions/bottom-nav.dart';
import 'package:dototick/screens/home.dart';
import 'package:dototick/screens/weekly.dart';
import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  PageViewPage({Key key}) : super(key: key);

  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  PageController pageController = PageController(initialPage: 0);
  dynamic currentIndex;
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
        index: currentIndex,
        backgroundColor: MyConstants.darkgrey,
        height: 55,
        color: MyConstants.verydarkgrey,
        onTap: (value) {
          currentIndex = value;
          pageController.jumpToPage(value);
        },
        items: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              pageController.jumpToPage(1);
            },
          ),
          IconButton(
              icon: Icon(
                Icons.list,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                pageController.jumpToPage(
                  2,
                );
              }),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (page) {
          setState(() {
            currentIndex = page;
          });
        },
        children: [
          HomePage(),
          WeeklyPlan(),
        ],
      ),
    );
  }
}
