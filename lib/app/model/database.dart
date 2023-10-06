import 'package:get_x_project/app/model/task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  late Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initdatabase();
    return _database;
  }

  Future<Database> _initdatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'notes.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
    CREATE TABLE Table (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      note TEXT,
      date TEXT,
      place TEXT,
      address TEXT,
    )
   ''');
    });
  }

  Future<int> insertTable(Task task) async {
    final db = await database;
    return await db.insert('Table', task.toMap());
  }

  Future<List<Task>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('table');
    return List.generate(maps.length, (i) {
      return Task.fromMap(maps[i]);
    });
  }
}
