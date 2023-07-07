import 'package:dictionary_challenge/app/features/home/domain/entities/data_word_entity.dart';
import 'package:dictionary_challenge/app/features/home/domain/helpers/params/get_data_word_param.dart';
import 'package:dictionary_challenge/app/features/home/external/mappers/data_word_mapper.dart';
import 'package:dictionary_challenge/app/features/home/infra/datasources/i_get_data_word_datasource.dart';

import '../../../../core/shared/services/http/helpers/params.dart';
import '../../../../core/shared/services/http/i_http_service.dart';

class GetDataWordDatasource implements IGetDataWordDatasource {
  final IHttpService _httpService;

  GetDataWordDatasource({
    required IHttpService httpService,
  }) : _httpService = httpService;

  @override
  Future<DataWordEntity?> call(GetDataWordParam param) async {
    final responseApi = await _httpService.get(
      GetHttpServiceParam(
        url:
            'https://www.wordsapi.com/mashape/words/${param.word}?when=2023-07-06T01:16:53.724Z&encrypted=8cfdb189e722949bea9707bfee58bfbfaeb52e0937fd93b8',
      ),
    );

    final result = DataWordMapper.fromMap(responseApi.data);
    return result;
  }
}
