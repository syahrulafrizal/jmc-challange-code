import 'package:jmc_test/app/config/constants/app_constant.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  static Future<sql.Database> openDb() async {
    return await sql.openDatabase(
      AppConstant.LOCAL_DB,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE IF NOT EXISTS ${AppConstant.LOCAL_DB_TABLE} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            provinceCode TEXT,
            provinceName TEXT,
            cityCode TEXT,
            cityName TEXT
          )
        ''');
      },
    );
  }

  static Future<int> insert(String table, Map<String, Object?> data) async {
    final db = await openDb();
    return db.insert(table, data);
  }

  static Future<List<Map<String, Object?>>> getData(String table) async {
    final db = await openDb();
    return db.query(table, orderBy: 'id DESC');
  }

  static Future<int> update(String table, int id, Map<String, Object?> data) async {
    final db = await openDb();
    return db.update(
      table,
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<int> delete(String table, int id) async {
    final db = await openDb();
    return db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
