import 'package:dartz/dartz.dart';

import '../../../../core/shared/failures/app_failure/i_app_failure.dart';
import '../entities/word_entity.dart';
import '../helpers/params/get_list_words_param.dart';

abstract class IGetListWordsRepository {
  Future<Either<IAppFailure, List<WordEntity>>> call(GetListWordParam params);
}
