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
          id TEXT PRIMARY KEY,
          code TEXT,
          description TEXT,
          record_data TEXT,
          updated_at TEXT
        )
        '''
        );
    }
  }
}
