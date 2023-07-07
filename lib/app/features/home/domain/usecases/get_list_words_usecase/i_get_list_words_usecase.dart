import 'package:dartz/dartz.dart';
import 'package:dictionary_challenge/app/core/shared/failures/app_failure/i_app_failure.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/word_entity.dart';
import 'package:dictionary_challenge/app/features/home/domain/helpers/params/get_list_words_param.dart';

abstract class IGetListWordsUsecase {
  Future<Either<IAppFailure, List<WordEntity>>> call(GetListWordParam params);
}
