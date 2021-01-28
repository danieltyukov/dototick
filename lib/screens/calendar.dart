import 'dart:core';

import 'package:dototick/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:dototick/functions/calendar_modals.dart';
import 'package:dototick/functions/db.dart';
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
  //
  DateTime _selectedDay = DateTime.now();

  CalendarController _calenderController;

  Map<DateTime, List<dynamic>> _events = {};

  List<dynamic> _selectedEvents = [];

  List<Widget> get _eventWidgets =>
      _selectedEvents.map((e) => events(e)).toList();

  //
  @override
  void initState() {
    super.initState();
    // DB.init().then((value) => _fetchEvents());
    _calenderController = CalendarController();
  }

  @override
  void dispose() {
    _calenderController.dispose();
    super.dispose();
  }

  //
  Widget events(var d) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(color: Theme.of(context).dividerColor),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(d, style: Theme.of(context).primaryTextTheme.bodyText1),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.trashAlt,
                color: Colors.redAccent,
                size: 15,
              ),
              // onPressed: () => _deleteEvent(d),
            )
          ],
        ),
      ),
    );
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedDay = day;
      _selectedEvents = events;
    });
  }

  void _create(BuildContext context) {
    String _name = "";
    var content = TextField(
      style: GoogleFonts.montserrat(
          color: Color.fromRGBO(105, 105, 108, 1), fontSize: 16),
      autofocus: true,
      decoration: InputDecoration(
        labelStyle: GoogleFonts.montserrat(
            color: Color.fromRGBO(59, 57, 60, 1),
            fontSize: 18,
            fontWeight: FontWeight.normal),
        labelText: 'Workout Name',
      ),
      onChanged: (value) {
        _name = value;
      },
    );

    //

    var btn = FlatButton(
      child: Text(
        'Save',
        style: GoogleFonts.montserrat(
            color: Color.fromRGBO(59, 57, 60, 1),
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      onPressed: () => _addEvent(_name),
    );

    //

    var cancelButton = FlatButton(
      child: Text(
        'Cancel',
        style: GoogleFonts.montserrat(
            color: Color.fromRGBO(59, 57, 60, 1),
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      onPressed: () => Navigator.of(context).pop(false),
    );

    //

    
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstants.darkgrey,
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
          ),

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
