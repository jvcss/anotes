import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static const String databaseName = 'philanthropy.db';
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

  Future<void> close(Database database) async {
    await database.close();
  }
}
