import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory docDir = await getApplicationDocumentsDirectory();
    String path = join(docDir.path, 'dototick.db');
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (
        Database db,
        int version,
      ) async {
        await db.execute("CREATE TABLE Calendar ("
            "id INTEGER PRIMARY KEY,"
            "name TEXT,"
            "date DATETIME"
            ")");
        await db.execute("CREATE TABLE Dailytasks ("
            "id INTEGER PRIMARY KEY,"
            "name TEXT"
            ")");
        await db.execute("CREATE TABLE Weektasks ("
            "id INTEGER PRIMARY KEY,"
            "day INTEGER,"
            "name TEXT"
            ")");
        print("Databases were formed");
      },
    );
  }
}
