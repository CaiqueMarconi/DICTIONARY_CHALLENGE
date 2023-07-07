import 'package:dictionary_challenge/app/core/shared/services/sqflite/helpers/db_strings.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/data_word_entity.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/word_entity.dart';
import 'package:dictionary_challenge/app/features/home/external/mappers/word_mapper.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../features/home/external/mappers/data_word_mapper.dart';
import 'i_sqflite_service.dart';

class SqfliteService implements ISqfliteService {
  @override
  Future<Database> createDbLocal() async {
    final pathDb = await getDatabasesPath();
    final locationDb = join(pathDb, DbStrings.nameDb);

    var resultDb = await openDatabase(
      locationDb,
      version: 1,
      onCreate: (db, currentVersion) async {
        await db.execute(DbStrings.tableFavorites);
        await db.execute(DbStrings.tableHistory);
      },
    );
    if (kDebugMode) {
      print(resultDb.isOpen);
    }
    return resultDb;
  }

  @override
  Future<void> saveDataWordDb({
    required DataWordEntity dataWord,
    required String table,
  }) async {
    final db = await createDbLocal();
    final id = await db.insert(
      table,
      DataWordMapper.toMap(dataWord),
    );
    if (kDebugMode) {
      print(id);
    }
  }

  @override
  Future<void> saveWordDb(
      {required WordEntity word, required String table}) async {
    final db = await createDbLocal();
    final id = await db.insert(
      table,
      WordMapper.toMap(word),
    );
    if (kDebugMode) {
      print(id);
    }
  }

  @override
  Future<List<DataWordEntity>> getListWordDb({required String sql}) async {
    final db = await createDbLocal();
    final data = await db.rawQuery(sql);
    return data.map((e) => DataWordMapper.fromMapByDb(e)).toList();
  }

  @override
  Future<void> deleteItemDb({
    required String word,
    required String table,
  }) async {
    final db = await createDbLocal();
    final id = await db.delete(
      table,
      where: 'word = ?',
      whereArgs: [word],
    );
    if (kDebugMode) {
      print(id);
    }
  }
}
