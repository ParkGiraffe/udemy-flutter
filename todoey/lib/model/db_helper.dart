import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todoey/model/task.dart';

final String mainTableName = 'tasks';

class DBHelper {
  var _db;

  // database 생성
  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(
      join(await getDatabasesPath(), 'tasks.db'),
      onCreate: (db, version) => _createDb(db),
      version: 1,
    );
    return _db;
  }

  // databse TABLE 생성
  static void _createDb(Database db) {
    db.execute('CREATE TABLE task(name TEXT PRIMARY KEY, isDone INTEGER)');
  }


  // Create(Insert)
  Future<void> insertTask(Task task) async {
    final db = await database;

    await db.insert(mainTableName, task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }


  // ReadAll
  Future<List<Task>> getAllTask() async {
    final db = await database;

    // 모든 task를 얻기 위해 테이블에 질의
    final List<Map<String, dynamic>> maps = await db.query('task');

    // List<Map<String, dynamic>>를 List<Task>으로 변환.
    return List.generate(maps.length, (i) {
      return Task(
        name: maps[i]['name'],
        isDone: maps[i]['isDone'],
      );
    });
  }

  // Read(name 값으로 찾기)
  Future<dynamic> getTask(String name) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('task', where: 'name = ?', whereArgs: [name]);

    return maps.isNotEmpty ? maps.first['name'] : null;
  }

  // Update
  Future<void> updateTask(Task task) async {
    final db = await database;

    // 주어진 task를 수정합니다.
    await db.update(
      mainTableName,
      task.toMap(),
      // task의 name이 일치하는 지 확인합니다.
      where: 'name = ?',
      whereArgs: [task.name],
    );
  }

  // Delete
  Future<void> deleteTask(String name) async {
    final db = await database;

    // 데이터베이스에서 Task를 삭제합니다.
    await db.delete(
      mainTableName,
      // 특정 Task를 제거하기 위해 'where'절을 사용.
      where: 'name = ?',
      whereArgs: [name];
    );
  }
}
