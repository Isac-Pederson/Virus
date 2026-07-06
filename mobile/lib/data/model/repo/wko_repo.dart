import 'dart:convert';
import 'package:virus/data/dbman.dart';
import 'package:virus/data/model/wko.dart';

class WkoRepository {
  static const _table = 'wko';
  final _db = DBMan.instance;

  Wko _fromRow(Map<String, dynamic> row) {
    final data =
        jsonDecode(row['record_data'] as String) as Map<String, dynamic>;
    return Wko.fromJson(data);
  }

  Map<String, dynamic> _toRow(Wko wko) {
    return {
      'id': wko.id,
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

  Future<Wko?> getById(String id) async {
    final row = await _db.queryById(_table, id);
    return row == null ? null : _fromRow(row);
  }

  Future<void> insert(Wko wko) => _db.upsert(_table, _toRow(wko));
  Future<void> update(Wko wko) => _db.update(_table, _toRow(wko));
  Future<void> delete(String id) => _db.delete(_table, id);
}
