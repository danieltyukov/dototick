import 'package:dototick/constants/constant.dart';
import 'package:flutter/material.dart';

void bottomsheet(BuildContext context) {
  showModalBottomSheet(
    elevation: 20,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: MyConstants.darkgrey,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                "Monday Tasks",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            CheckboxListTile(
              value: false,
              onChanged: (value) {},
            ),
          ],
        ),
      );
    },
  );
}
