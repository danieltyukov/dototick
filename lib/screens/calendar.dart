import 'dart:core';

import 'package:dototick/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:dototick/functions/calendar_modals.dart';
import 'package:dototick/functions/db.dart';
import 'package:google_fonts/google_fonts.dart';
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

  CalendarController _calendarController;

  Map<DateTime, List<dynamic>> _events = {};
  List<CalendarItem> _data = [];

  List<dynamic> _selectedEvents = [];
  List<Widget> get _eventWidgets =>
      _selectedEvents.map((e) => events(e)).toList();

//initialize the calendar state and dispose it when inactive
  void initState() {
    super.initState();
    DB.init().then((value) => _fetchEvents());
    _calendarController = CalendarController();
  }

  void dispose() {
    _calendarController.dispose();
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
            top: BorderSide(color: Colors.white),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              d,
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.trashAlt,
                  color: Colors.red,
                  size: 15,
                ),
                onPressed: () => _deleteEvent(d))
          ],
        ),
      ),
    );
  }

  void _onDaySelected(DateTime day, List events, _) {
    setState(
      () {
        _selectedDay = day;
        _selectedEvents = events;
      },
    );
  }

  //create the event
  void _create(BuildContext context) {
    //
    String _name = "";
    TextEditingController textEditingController = TextEditingController();
    // ignore: unused_local_variable
    bool textEditingValidator = false;
    //

    bool validateTextField(String userInput) {
      if (userInput.isEmpty) {
        setState(() {
          textEditingValidator = true;
        });
        return true;
      }
      setState(() {
        textEditingValidator = false;
      });
      return false;
    }

    var content = TextField(
      maxLength: 30,
      controller: textEditingController,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white70),
      autofocus: true,
      decoration: InputDecoration(
        counterStyle: TextStyle(color: Colors.white),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        labelText: 'Name Of Task',
      ),
      onChanged: (value) {
        _name = value;
      },
    );
    var btn = FlatButton(
        child: const Text(
          'SUBMIT',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          bool val = validateTextField(textEditingController.text);
          print(val);
          if (val == false) {
            if (textEditingController.text.length <= 30) {
              _addEvent(_name);
            }
            print('over 30 letters');
          } else {
            print('enter something');
          }
        });
    var cancelButton = FlatButton(
      child: const Text(
        'CANCEL',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () => Navigator.of(context).pop(false),
    );

    //shows dialog to create event
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: AlertDialog(
          elevation: 0,
          backgroundColor: MyConstants.blue,
          contentPadding: const EdgeInsets.all(16.0),
          content: Row(
            children: <Widget>[
              Expanded(child: content),
            ],
          ),
          actions: <Widget>[
            btn,
            cancelButton,
          ],
        ),
      ),
    );
  }

  void _fetchEvents() async {
    _events = {};
    List<Map<String, dynamic>> _results = await DB.query(CalendarItem.table);
    _data = _results.map((item) => CalendarItem.fromMap(item)).toList();
    _data.forEach(
      (element) {
        DateTime formattedDate = DateTime.parse(
          DateFormat('yyyy-MM-dd').format(
            DateTime.parse(
              element.date.toString(),
            ),
          ),
        );
        if (_events.containsKey(formattedDate)) {
          _events[formattedDate].add(
            element.name.toString(),
          );
        } else {
          _events[formattedDate] = [
            element.name.toString(),
          ];
        }
      },
    );
    setState(() {});
  }

  void _addEvent(String event) async {
    CalendarItem item =
        CalendarItem(date: _selectedDay.toString(), name: event);
    await DB.insert(CalendarItem.table, item);
    _selectedEvents.add(event);
    _fetchEvents();

    Navigator.pop(context);
  }

  //

  void _deleteEvent(String s) {
    List<CalendarItem> d = _data.where((element) => element.name == s).toList();
    if (d.length == 1) {
      DB.delete(CalendarItem.table, d[0]);
      _selectedEvents.removeWhere((e) => e == s);
      _fetchEvents();
    }
  }

  //displays the actual calendar
  Widget calendar() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        gradient: LinearGradient(
          colors: [
            MyConstants.verydarkgrey,
            MyConstants.verydarkgrey,
          ],
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: new Offset(0.0, 5),
          ),
        ],
      ),
      child: TableCalendar(
        calendarStyle: CalendarStyle(
          canEventMarkersOverflow: true,
          markersColor: Colors.white,
          weekdayStyle: TextStyle(color: Colors.white),
          todayColor: Colors.white54,
          todayStyle: TextStyle(
              color: MyConstants.blue,
              fontSize: 15,
              fontWeight: FontWeight.bold),
          selectedColor: MyConstants.darkblue,
          outsideWeekendStyle: TextStyle(color: Colors.white60),
          outsideStyle: TextStyle(color: Colors.white60),
          weekendStyle: TextStyle(color: Colors.white),
          renderDaysOfWeek: false,
        ),

        //
        onDaySelected: _onDaySelected,
        calendarController: _calendarController,
        events: _events,
        //

        headerStyle: HeaderStyle(
          leftChevronIcon:
              Icon(Icons.arrow_back_ios, size: 15, color: Colors.white),
          rightChevronIcon:
              Icon(Icons.arrow_forward_ios, size: 15, color: Colors.white),
          titleTextStyle:
              GoogleFonts.montserrat(color: Colors.white, fontSize: 16),
          formatButtonDecoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(20),
          ),
          formatButtonTextStyle: GoogleFonts.montserrat(
              color: MyConstants.blue,
              fontSize: 13,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
  //

  //shows whether event exists or not
  Widget eventTitle() {
    if (_selectedEvents.length == 0) {
      return Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
        child: Text(
          'No Events',
          style: TextStyle(color: Colors.white),
        ),
      );
    }
    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
      child: Text(
        "Events",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

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
              children: [
                Text(
                  'Calender',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          //displays calendar
          calendar(),
          //decides whether event exists or not
          eventTitle(),
          //displays events
          Column(children: _eventWidgets),
          SizedBox(height: 60),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        //pops up create new event on the date.
        onPressed: () => _create(context),
        //
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: MyConstants.lightgrey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
