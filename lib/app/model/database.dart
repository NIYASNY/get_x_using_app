// import 'package:get_x_project/app/model/task.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DbHelper {
//   late Database _database;

//   Future<Database> get database async {
//     if (_database != null) return _database;

//     _database = await _initdatabase();
//     return _database;
//   }

//   Future<Database> _initdatabase() async {
//     final databasesPath = await getDatabasesPath();
//     final path = join(databasesPath, 'notes.db');

//     return await openDatabase(path, version: 1, onCreate: (db, version) async {
//       await db.execute('''
//     CREATE TABLE Table (
//       id INTEGER PRIMARY KEY AUTOINCREMENT,
//       title TEXT,
//       note TEXT,
//       date TEXT,
//       place TEXT,
//       address TEXT,
//     )
//    ''');
//     });
//   }

//   Future<int> insertTable(Task task) async {
//     final db = await database;
//     return await db.insert('Table', task.toMap());
//   }

//   Future<List<Task>> getTasks() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('table');
//     return List.generate(maps.length, (i) {
//       return Task.fromMap(maps[i]);
//     });
//   }
// }

import 'package:get_x_project/app/model/task.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

class DbHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = 'tasks';

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'tasks.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          print("creating a new one");
          return db.execute("CREATE TABLE $_tableName("
              "id INTEGER PRIMARY KEY AUTOINCREMENT, "
              "title STRING, note TEXT, date STRING, "
              "place STRING, address STRING, "
              ")");
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Task? task) async {
    print('insert is called');
    return await _db?.insert(_tableName, task!.toMap()) ?? 1;
  }

  // static Future<List<Map<String, dynamic>>> query() async {
  //   print('query is called');
  //   return await _db!.query(_tableName);
  // }

  static Future<List<Map<String, dynamic>>> query() async {
    try {
      print('queary is called');
      return await _db!.query(_tableName);
    } catch (e) {
      print('error querying data : $e');
      return [];
    }
  }

  static delete(Task task) async {
    await _db!.delete(_tableName, where: 'id=?', whereArgs: [task.id]);
  }
}
