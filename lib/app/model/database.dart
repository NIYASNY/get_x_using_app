import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'task.dart';

class DbHelper {
  static final _databasename = 'app_db';
  static final _tasks_table = 'task_table';
  static final _databaseversion = 1;
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  _initDb() async {
    String path = join(await getDatabasesPath(), _databasename);

    return await openDatabase(
      path,
      version: _databaseversion,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $_tasks_table('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, id int, name String, age int, position String, place String, address String'
        ')');
  }

  Future<List<Map<String, dynamic>>> quaryall() async {
    Database? db = await DbHelper._database;
    return await db!.query(_tasks_table);
  }

  Future<int> insertTask(Task task) async {
    Database? db = await DbHelper._database;
    return await db!.insert(_tasks_table, {
      'id': task.id,
      'name': task.name,
      'age': task.age,
      'position': task.position,
      'place': task.place,
      'address': task.address,
    });
  }

  Future<int> delete(int id) async {
    Database? db = await DbHelper._database;
    return await db!.delete(_tasks_table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAllTasks() async {
    Database? db = await DbHelper._database;
    return await db!.delete(_tasks_table);
  }

  Future<int> update(int id) async {
    return await _database!.rawUpdate('''
  UPDATE $_tasks_table
  WHERE id = ?

  ''', [1, 1, id]);
  }
}
