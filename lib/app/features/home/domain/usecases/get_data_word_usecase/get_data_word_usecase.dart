import 'package:dartz/dartz.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/data_word_entity.dart';
import 'package:dictionary_challenge/app/features/home/domain/helpers/params/get_data_word_param.dart';

import '../../../../../core/shared/failures/app_failure/i_app_failure.dart';
import '../../repositories/i_get_data_word_repository.dart';
import 'i_get_data_word_usecase.dart';

class GetDataWordUsecase implements IGetDataWordUsecase {
  final IGetDataWordRepository _repository;

  const GetDataWordUsecase(this._repository);
  @override
  Future<Either<IAppFailure, DataWordEntity?>> call(
    GetDataWordParam params,
  ) async {
    final result = await _repository.call(params);
    return result;
  }
}
