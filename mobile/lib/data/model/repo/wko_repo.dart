import 'dart:convert';
import 'package:virus/data/dbman.dart';
import 'package:virus/data/model/wko.dart';

class WkoRepository {
  static const _table = 'workorder';
  final _db = DBMan.instance;

Wko _fromRow(Map<String, dynamic> row) {
    final data =
        jsonDecode(row['record_data'] as String) as Map<String, dynamic>;

    final wko = Wko.fromJson(data);

    return wko.copyWith(id: row['id'] as int);
  }

  Map<String, dynamic> _toRow(Wko wko) {
    return {
      'code': wko.code,
      'description': wko.description,
      'record_data': jsonEncode(wko.toJson()),
      'updated_at': wko.updatedAt.toIso8601String(),
    };
  }

//TODO NEXT: ADD DB FUNCTIONS
  Future<List<Wko>> getAll() async {
    final rows = await _db.queryAll(_table);
    return rows.map(_fromRow).toList();
  }

  Future<Wko?> getById(int id) async {
    final row = await _db.queryById(_table, id);
    return row == null ? null : _fromRow(row);
  }

  Future<Wko> insert(Wko wko) async{
    final id = await _db.upsert(_table, _toRow(wko));
    return wko.copyWith(id: id); 
  } 
  Future<void> update(Wko wko) => _db.update(_table,wko.id!,_toRow(wko));
  Future<void> delete(int id) => _db.delete(_table, id);
}
