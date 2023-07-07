import 'package:dartz/dartz.dart';
import 'package:dictionary_challenge/app/core/shared/failures/app_failure/i_app_failure.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/data_word_entity.dart';
import 'package:dictionary_challenge/app/features/home/domain/helpers/params/get_data_word_param.dart';
import 'package:dictionary_challenge/app/features/home/domain/repositories/i_get_data_word_repository.dart';
import 'package:dictionary_challenge/app/features/home/infra/datasources/i_get_data_word_datasource.dart';

class GetDataWordRepository implements IGetDataWordRepository {
  final IGetDataWordDatasource _datasource;

  const GetDataWordRepository(this._datasource);

  @override
  Future<Either<IAppFailure, DataWordEntity?>> call(
    GetDataWordParam param,
  ) async {
    try {
      final result = await _datasource.call(param);
      return Right(result);
    } on IAppFailure catch (e) {
      return Left(e);
    }
  }
}
