import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBMan {
  //singleton
  DBMan._internal();
  static final DBMan instance = DBMan._internal();
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    var path = join(await getDatabasesPath(), 'virus.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    //everything here is flattened for simplicity, but having filtered types (inv_type, wko_type, wko_status, etc) extracted
    // as their own columns would improve performance
    List tbl = ['workorder','asset','part','employees','user'];

    for (var table in tbl) {
      await db.execute(
        '''
         CREATE TABLE $table (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          code TEXT,
          description TEXT,
          record_data TEXT,
          updated_at TEXT
        )
        '''
        );
    }
  }
   Future<int> upsert(String table, Map<String, dynamic> row) async {
    final db = await database;
    return db.insert(table, row, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> queryAll(String table) async {
    final db = await database;
    return db.query(table);
  }

  Future<Map<String, dynamic>?> queryById(String table, int id) async {
    final db = await database;
    final rows = await db.query(table, where: 'id = ?', whereArgs: [id]);
    return rows.isEmpty ? null : rows.first;
  }

Future<int> update(String table, int id, Map<String, dynamic> row) async {
    final db = await database;

    final allRows = await db.query(table);
    print('ALL ROWS: $allRows');

    final matchingRows = await db.query(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
    print('MATCHING ROWS: $matchingRows');

    final count = await db.update(table, row, where: 'id = ?', whereArgs: [id]);

    print('UPDATE $table WHERE id=$id -> $count rows');

    return count;
  }

  Future<int> delete(String table, int id) async {
    final db = await database;
    return db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
    _db = null;
  }
}
