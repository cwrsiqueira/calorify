import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GETALLFOODS
Future<List<GetAllFoodsRow>> performGetAllFoods(
  Database database,
) {
  final query = '''
SELECT * FROM foods LIMIT 10
''';
  return _readQuery(database, query, (d) => GetAllFoodsRow(d));
}

class GetAllFoodsRow extends SqliteRow {
  GetAllFoodsRow(Map<String, dynamic> data) : super(data);

  int get id => data['id'] as int;
  String get name => data['name'] as String;
  double get measure => data['measure'] as double;
  double get weight => data['weight'] as double;
  int get calories => data['calories'] as int;
}

/// END GETALLFOODS
