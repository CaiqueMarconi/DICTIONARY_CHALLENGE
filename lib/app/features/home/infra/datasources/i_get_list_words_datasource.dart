import '../../domain/entities/word_entity.dart';
import '../../domain/helpers/params/get_list_words_param.dart';

abstract class IGetListWordsDatasouce {
  Future<List<WordEntity>> call(GetListWordParam params);
}
