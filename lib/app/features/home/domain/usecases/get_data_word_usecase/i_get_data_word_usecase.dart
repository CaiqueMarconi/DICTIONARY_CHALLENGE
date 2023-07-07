import 'package:dartz/dartz.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/data_word_entity.dart';
import 'package:dictionary_challenge/app/features/home/domain/helpers/params/get_data_word_param.dart';
import '../../../../../core/shared/failures/app_failure/i_app_failure.dart';

abstract class IGetDataWordUsecase {
  Future<Either<IAppFailure, DataWordEntity?>> call(GetDataWordParam params);
}
