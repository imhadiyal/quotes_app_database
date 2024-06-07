import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

import '../modals/quotes_modals.dart';

enum QuoteTable { id, quote, author }

class QuoteDataBase {
  QuoteDataBase._();
  static final QuoteDataBase quoteDataBase = QuoteDataBase._();

  late Database database;
  Logger logger = Logger();
  String db_name = 'data_base.db';
  String table_name = 'quotes_table';
  String sql = 'Query here';

  Future<void> initDataBase() async {
    String dbPath = await getDatabasesPath();
    database = await openDatabase(
      "$dbPath/$db_name",
      version: 2,
      onCreate: (db, version) {},
      onUpgrade: (db, v1, v2) {
        sql =
            "CREATE TABLE IF NOT EXISTS $table_name(${QuoteTable.id.name} INTEGER PRIMARY KEY AUTOINCREMENT, ${QuoteTable.quote.name} TEXT, ${QuoteTable.author.name} TEXT);";
        db
            .execute(sql)
            .then(
              (value) => logger.i('table created'),
            )
            .onError(
              (error, stackTrace) =>
                  logger.e('Table not created\n Error: $error'),
            );
      },
      onDowngrade: (version, v1, v2) {},
    );
  }

  Future<void> insetData({required Quote quote}) async {
    Map<String, dynamic> data = quote.toMap();
    data.remove('id');
    await database
        .insert(table_name, data)
        .then((value) => logger.i('!Query! ${quote.quote} inserted '))
        .onError((error, stackTrace) =>
            logger.e(' !Query!${quote.quote} insertion error'));
  }

  Future<void> deleteData({required Quote quote}) async {
    await database
        .delete(
          table_name,
          where: '${QuoteTable.id.name} = ?',
          whereArgs: [quote.id],
        )
        .then((value) => logger.i('${quote.quote} deleted'))
        .onError(
            (error, stackTrace) => logger.e('${quote.quote} deletion $error'));
  }

  Future<List<Quote>> getAllData() async {
    sql = 'SELECT * FROM $table_name;';
    List<Map<String, dynamic>> data = await database.rawQuery(sql);

    return data.map((e) => Quote.fromJson(e)).toList();
  }
}
