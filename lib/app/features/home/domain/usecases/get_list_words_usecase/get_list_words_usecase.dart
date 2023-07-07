import 'package:dartz/dartz.dart';
import 'package:dictionary_challenge/app/core/shared/failures/app_failure/i_app_failure.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/word_entity.dart';
import 'package:dictionary_challenge/app/features/home/domain/helpers/params/get_list_words_param.dart';
import 'package:dictionary_challenge/app/features/home/domain/repositories/i_get_list_words_repository.dart';
import 'package:dictionary_challenge/app/features/home/domain/usecases/get_list_words_usecase/i_get_list_words_usecase.dart';

class GetListWordUsecase implements IGetListWordsUsecase {
  final IGetListWordsRepository _repository;

  const GetListWordUsecase(this._repository);
  @override
  Future<Either<IAppFailure, List<WordEntity>>> call(
    GetListWordParam params,
  ) async {
    final result = await _repository.call(params);
    return result;
  }
}
