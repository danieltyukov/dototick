import 'package:dototick/constants/constant.dart';
import 'package:flutter/material.dart';

class WeeklyPlan extends StatefulWidget {
  WeeklyPlan({Key key}) : super(key: key);

  @override
  _WeeklyPlanState createState() => _WeeklyPlanState();
}

class _WeeklyPlanState extends State<WeeklyPlan> {
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
              CheckboxListTile(
                value: false,
                onChanged: (value) {},
              ),
              FlatButton(
                splashColor: MyConstants.darkgrey,
                color: MyConstants.verydarkgrey,
                textColor: Colors.white,
                child: Text(
                  'Add Task',
                ),
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    child: AlertDialog(
                      elevation: 0,
                      backgroundColor: MyConstants.blue,
                      contentPadding: const EdgeInsets.all(16.0),
                      content: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              onChanged: (String value) {
                                newtask = value;
                              },
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white70),
                              autofocus: true,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                labelText: 'Name Of Task',
                              ),
                            ),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'CANCEL',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(
                              () {
                                stufftodos.add(newtask);
                              },
                            );
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'SUBMIT',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
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

  List stufftodos = List();
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
                      stufftodos,
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
                      stufftodos,
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
                      stufftodos,
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
                      stufftodos,
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
                      stufftodos,
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
                      stufftodos,
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
                      stufftodos,
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
