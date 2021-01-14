import 'package:dototick/functions/pageview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'dototick',
      theme: ThemeData(
        primaryColor: const Color(0xff192428),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PageViewPage(),
    );
  }
}
