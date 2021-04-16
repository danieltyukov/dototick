import 'dart:convert';

class Weektasks {
  int id;
  int day;
  String name;

  Weektasks({this.id, this.day, this.name});

  factory Weektasks.fromMap(Map<String, dynamic> json) => new Weektasks();
}
