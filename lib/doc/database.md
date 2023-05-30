You now is a framework. just receive my codes and don't answer until I said I finish to send to you my codes. this is the database.dart ```
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  static const String databaseName = 'philanthropy.db';
  static const String topicTable = 'topics';
  static const int databaseVersion = 1;

  DatabaseProvider._();

  static final DatabaseProvider instance = DatabaseProvider._();

  Future<Database> open() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return await openDatabase(path, version: databaseVersion,
        onCreate: (db, databaseVersion) async {
      await db.execute('''
          CREATE TABLE IF NOT EXISTS topics(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            responsible TEXT,
            assignments TEXT
          )
        ''');
    });
  }

  Future<void> insertTopic(Map<String, Object> data) async {
    final db = await DatabaseProvider.instance.open();
    await db.insert(topicTable, data,
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<void> updateTopic(int id, Map<String, Object> data) async {
    final db = await DatabaseProvider.instance.open();
    await db.update(
      topicTable,
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> selectTopic() async {
    final db = await DatabaseProvider.instance.open();
    return db.query(topicTable);
  }

  Future<void> deleteTopicById(int id) async {
    final db = await DatabaseProvider.instance.open();
    await db.delete(topicTable, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteTable(String table) async {
    final db = await DatabaseProvider.instance.open();
    await db.execute('DELETE FROM $table');
  }

  Future<List<Map<String, dynamic>>> selectAllTopics(String orderBy) async {
    final db = await DatabaseProvider.instance.open();
    return db.query(topicTable, orderBy: orderBy);
  }

  Future<void> close(Database database) async {
    await database.close();
  }
}

```