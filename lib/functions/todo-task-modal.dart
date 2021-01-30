//identifying each event
class ToDoItem {
  static String table = 'todo';

  int id;
  String name;
  String date;

  ToDoItem({this.id, this.date, this.name});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'date': date,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  static ToDoItem fromMap(Map<String, dynamic> map) {
    return ToDoItem(
      id: map['id'],
      date: map['date'],
      name: map['name'],
    );
  }
}