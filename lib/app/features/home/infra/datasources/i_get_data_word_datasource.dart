import 'package:dictionary_challenge/app/features/home/domain/entities/data_word_entity.dart';
import 'package:dictionary_challenge/app/features/home/domain/helpers/params/get_data_word_param.dart';

abstract class IGetDataWordDatasource {
  Future<DataWordEntity?> call(GetDataWordParam param);
}
