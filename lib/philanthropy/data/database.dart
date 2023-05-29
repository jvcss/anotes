import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  static const String topicTable = 'topics';

  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, 'philanthropy.db'),
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE IF NOT EXISTS $topicTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            responsible TEXT,
            assignments TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  //insertTopic, selectAllTopics, deleteTopicById, deleteTable, selectTopicById, selectTopic

  // Insert data
  static Future<void> insertTopic(Map<String, Object> data) async {
    final db = await DatabaseProvider.database();
    await db.insert(topicTable, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Update topic by ID
  static Future<void> updateTopic(int id, Map<String, Object> data) async {
    final db = await DatabaseProvider.database();
    await db.update(
      topicTable,
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Select all topics
  static Future<List<Map<String, dynamic>>> selectAllTopics(
      String orderBy) async {
    final db = await DatabaseProvider.database();
    return db.query(topicTable, orderBy: orderBy);
  }

  // Select topic by ID
  static Future<List<Map<String, dynamic>>> selectTopicById(int id) async {
    final db = await DatabaseProvider.database();
    return db.query(topicTable, where: 'id = ?', whereArgs: [id]);
  }

  // Delete topic by ID
  static Future<void> deleteTopicById(int id) async {
    final db = await DatabaseProvider.database();
    await db.delete(topicTable, where: 'id = ?', whereArgs: [id]);
  }

  // Delete table
  static Future<void> deleteTable(String table) async {
    final db = await DatabaseProvider.database();
    await db.execute('DELETE FROM $table');
  }

  // Select all topics
  static Future<List<Map<String, dynamic>>> selectTopic() async {
    final db = await DatabaseProvider.database();
    return db.query(topicTable);
  }
}
