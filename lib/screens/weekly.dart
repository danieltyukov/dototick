import 'dart:core';

import 'package:dototick/constants/constant.dart';
import 'package:flutter/material.dart';

class WeeklyPlan extends StatefulWidget {
  WeeklyPlan({Key key}) : super(key: key);

  @override
  _WeeklyPlanState createState() => _WeeklyPlanState();
}

class _WeeklyPlanState extends State<WeeklyPlan> {
  TextEditingController textEditingController = TextEditingController();

  bool textEditingValidator = false;

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

  void bottomsheet(
    BuildContext context,
    String weekday,
    List stufftodos,
    String newtask,
  ) {
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
                  "$weekday Tasks",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

              //
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: stufftodos.length,
                itemBuilder: (context, int index) {
                  return Dismissible(
                    background: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        margin: EdgeInsets.all(4),
                        color: Colors.red,
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Icon(Icons.delete),
                          margin: EdgeInsets.only(left: 5),
                        ),
                      ),
                    ),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (direction) => stufftodos.removeAt(index),
                    key: UniqueKey(),
                    child: Card(
                      color: MyConstants.lightgrey,
                      margin: EdgeInsets.all(4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ListTile(
                        title: Text(
                          stufftodos[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              //
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue[900],
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text(
                  'Add Task',
                  // style: TextStyle(
                  //   color: Colors.white,
                  // ),
                ),
                onPressed: () {
                  showDialog<String>(
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
                            Expanded(
                              child: TextField(
                                maxLength: 30,
                                controller: textEditingController,
                                onChanged: (String value) {
                                  newtask = value;
                                },
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white70),
                                autofocus: true,
                                decoration: InputDecoration(
                                  counterStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  labelText: 'Name Of Task',
                                ),
                              ),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'CANCEL',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(
                                () {
                                  bool val = validateTextField(
                                      textEditingController.text);
                                  print(val);
                                  if (val == false) {
                                    if (textEditingController.text.length <=
                                        30) {
                                      stufftodos.add(newtask);
                                      Navigator.pop(context);
                                    }
                                    print('over 30 letters');
                                  } else {
                                    print('enter something');
                                  }
                                },
                              );
                            },
                            child: const Text(
                              'SUBMIT',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }

  String newtask = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstants.darkgrey,
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    bottomsheet(
                      context,
                      "Monday",
                      MyConstants.monList,
                      newtask,
                    );
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

                GestureDetector(
                  onTap: () {
                    bottomsheet(
                      context,
                      "Tuesday",
                      MyConstants.tueList,
                      newtask,
                    );
                  },
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
                      color: MyConstants.orange,
                    ), //BoxDecoration
                  ),
                ), //

                SizedBox(
                  height: 10,
                ),

                GestureDetector(
                  onTap: () {
                    bottomsheet(
                      context,
                      "Wednesday",
                      MyConstants.wedList,
                      newtask,
                    );
                  },
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
                      color: MyConstants.yellow,
                    ), //BoxDecoration
                  ),
                ), //

                SizedBox(
                  height: 10,
                ),

                GestureDetector(
                  onTap: () {
                    bottomsheet(
                      context,
                      "Thursday",
                      MyConstants.thuList,
                      newtask,
                    );
                  },
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
                      color: MyConstants.green,
                    ), //BoxDecoration
                  ),
                ), //

                SizedBox(
                  height: 10,
                ),

                GestureDetector(
                  onTap: () {
                    bottomsheet(
                      context,
                      "Friday",
                      MyConstants.friList,
                      newtask,
                    );
                  },
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
                      color: MyConstants.lightbluecolor,
                    ), //BoxDecoration
                  ),
                ), //

                SizedBox(
                  height: 10,
                ),

                GestureDetector(
                  onTap: () {
                    bottomsheet(
                      context,
                      "Saturday",
                      MyConstants.satList,
                      newtask,
                    );
                  },
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
                      color: MyConstants.bluecolor,
                    ), //BoxDecoration
                  ),
                ), //

                SizedBox(
                  height: 10,
                ),

                GestureDetector(
                  onTap: () {
                    bottomsheet(
                      context,
                      "Sunday",
                      MyConstants.sunList,
                      newtask,
                    );
                  },
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
                      color: MyConstants.purple,
                    ), //BoxDecoration
                  ),
                ), //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
