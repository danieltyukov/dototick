import 'package:flutter/material.dart';

Widget weeklygraph() {
  return Center(
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Flexible(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                  ),
                  child: Text(
                    "Monday",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 60,
                    ),
                  ),
                ),

                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ), //BoxDecoration
              ), //
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                  ),
                  child: Text(
                    "Tuesday",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 60,
                    ),
                  ),
                ),

                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange,
                ), //BoxDecoration
              ), //
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                  ),
                  child: Text(
                    "Wednesday",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 60,
                    ),
                  ),
                ),

                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                ), //BoxDecoration
              ), //
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                  ),
                  child: Text(
                    "Thursday",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 60,
                    ),
                  ),
                ),

                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ), //BoxDecoration
              ), //
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                  ),
                  child: Text(
                    "Friday",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 60,
                    ),
                  ),
                ),

                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightBlue,
                ), //BoxDecoration
              ), //
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                  ),
                  child: Text(
                    "Saturday",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 60,
                    ),
                  ),
                ),

                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[700],
                ), //BoxDecoration
              ), //
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                  ),
                  child: Text(
                    "Sunday",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 60,
                    ),
                  ),
                ),

                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.purple,
                ), //BoxDecoration
              ), //
            ),
          ],
        ),
      ),
    ),
  );
}
