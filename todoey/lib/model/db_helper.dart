import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todoey/model/task.dart';

final String mainTableName = 'tasks';

class DBHelper {
  var _db;

  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(
      join(await getDatabasesPath(), 'tasks.db'),
      onCreate: (db, version) => _createDb(db),
      version: 1,
    );
    return _db;
  }

  static void _createDb(Database db) {
    db.execute('CREATE TABLE tasks(name TEXT PRIMARY KEY, isDone INTEGER)');
  }

  Future<void> insertTask(Task task) async {
    final db = await database;

    await db.insert(mainTableName, task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
