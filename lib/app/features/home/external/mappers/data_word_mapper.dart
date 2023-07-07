import 'package:dictionary_challenge/app/features/home/domain/entities/data_word_entity.dart';

class DataWordMapper {
  static DataWordEntity fromMap(Map<String, dynamic> map) {
    String pronunciation = '';
    if (map['pronunciation'] != null) {
      dynamic pronunciationValue = map['pronunciation'];

      if (pronunciationValue is String) {
        pronunciation = pronunciationValue;
      } else if (pronunciationValue is Map<String, dynamic> &&
          pronunciationValue['all'] != null) {
        pronunciation = pronunciationValue['all'];
      }
    }
    return DataWordEntity(
      word: map['word'],
      pronunciation: pronunciation,
      definition:
          map.containsKey('results') ? map['results'][0]['definition'] : '',
    );
  }

  static DataWordEntity fromMapByDb(Map<String, dynamic> map) {
    return DataWordEntity(
      word: map['word'],
      pronunciation: map['pronunciation'],
      definition: map['definition'],
    );
  }

  static Map<String, dynamic> toMap(DataWordEntity dataWord) {
    return {
      'word': dataWord.word,
      'pronunciation': dataWord.pronunciation,
      'definition': dataWord.definition,
    };
  }
}
