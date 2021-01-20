import 'dart:core';

import 'package:dototick/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cal/calendar_model.dart';
import 'package:flutter_cal/db.dart';
import 'package:flutter_cal/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  Calendar({Key key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstants.darkgrey,
      body: ListView(
        children: <Widget>[
          // calendar(),
          // eventTitle(),
          // Column(children: _eventWidgets),
          SizedBox(
            height: 60,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => _create(context),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: MyConstants.darkgrey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
