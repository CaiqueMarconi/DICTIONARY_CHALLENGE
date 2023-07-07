import 'package:dictionary_challenge/app/features/home/domain/entities/word_entity.dart';

class WordMapper {
  static WordEntity fromMap(Map<String, dynamic> map) {
    return WordEntity(word: map['1']);
  }

  static Map<String, dynamic> toMap(WordEntity word) {
    return {
      'word': word.word,
    };
  }
}
