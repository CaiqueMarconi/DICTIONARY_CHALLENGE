import 'package:dictionary_challenge/app/features/home/domain/entities/data_word_entity.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../features/home/domain/entities/word_entity.dart';

abstract class ISqfliteService {
  Future<Database> createDbLocal();

  Future<void> saveDataWordDb({
    required DataWordEntity dataWord,
    required String table,
  });

  Future<void> saveWordDb({
    required WordEntity word,
    required String table,
  });

  Future<List<DataWordEntity>> getListWordDb({
    required String sql,
  });

  Future<void> deleteItemDb({
    required String word,
    required String table,
  });
}
