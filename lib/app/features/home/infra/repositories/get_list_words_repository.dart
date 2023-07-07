import 'package:dartz/dartz.dart';
import 'package:dictionary_challenge/app/core/shared/failures/app_failure/i_app_failure.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/word_entity.dart';
import 'package:dictionary_challenge/app/features/home/domain/helpers/params/get_list_words_param.dart';
import 'package:dictionary_challenge/app/features/home/domain/repositories/i_get_list_words_repository.dart';
import 'package:dictionary_challenge/app/features/home/infra/datasources/i_get_list_words_datasource.dart';

class GetListWordsRepository implements IGetListWordsRepository {
  final IGetListWordsDatasouce _datasource;

  const GetListWordsRepository(this._datasource);
  @override
  Future<Either<IAppFailure, List<WordEntity>>> call(
      GetListWordParam params) async {
    try {
      final result = await _datasource.call(params);
      return Right(result);
    } on IAppFailure catch (e) {
      return Left(e);
    }
  }
}
