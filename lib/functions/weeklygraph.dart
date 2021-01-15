import 'package:dototick/constants/constant.dart';
import 'package:dototick/functions/bottomsheet.dart';
import 'package:flutter/material.dart';

Widget weeklygraph(BuildContext context) {
  return Center(
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                bottomsheet(context);
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                  ),
                  child: const Text(
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
                  color: MyConstants.red,
                ), //BoxDecoration
              ),
            ), //

            SizedBox(
              height: 10,
            ),

            Container(
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
                color: MyConstants.orange,
              ), //BoxDecoration
            ), //

            SizedBox(
              height: 10,
            ),

            Container(
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
                color: MyConstants.yellow,
              ), //BoxDecoration
            ), //

            SizedBox(
              height: 10,
            ),

            Container(
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
                color: MyConstants.green,
              ), //BoxDecoration
            ), //

            SizedBox(
              height: 10,
            ),

            Container(
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
                color: MyConstants.lightbluecolor,
              ), //BoxDecoration
            ), //

            SizedBox(
              height: 10,
            ),

            Container(
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
                color: MyConstants.bluecolor,
              ), //BoxDecoration
            ), //

            SizedBox(
              height: 10,
            ),

            Container(
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
                color: MyConstants.purple,
              ), //BoxDecoration
            ), //
          ],
        ),
      ),
    ),
  );
}
