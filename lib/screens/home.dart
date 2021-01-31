import 'package:dototick/constants/constant.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> todos = [];
  String inputtask = '';

  TextEditingController textEditingController = TextEditingController();
  // ignore: unused_local_variable
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstants.darkgrey,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: MyConstants.lightgrey,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: _showDialog,
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
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
            onDismissed: (direction) => todos.removeAt(index),
            key: UniqueKey(),
            child: Card(
              color: MyConstants.lightgrey,
              margin: EdgeInsets.all(4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: ListTile(
                title: Text(
                  todos[index],
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
    );
  }

  _showDialog() async {
    return await showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: AlertDialog(
          elevation: 0,
          backgroundColor: MyConstants.blue,
          contentPadding: const EdgeInsets.all(16.0),
          content: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: textEditingController,
                  maxLength: 30,
                  onChanged: (String value) {
                    inputtask = value;
                  },
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white70),
                  autofocus: true,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
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
                    bool val = validateTextField(textEditingController.text);
                    print(val);
                    if (val == false) {
                      if (textEditingController.text.length <= 30) {
                        todos.add(inputtask);
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
  }
}
