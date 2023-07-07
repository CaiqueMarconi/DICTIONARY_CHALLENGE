import 'package:dictionary_challenge/app/core/shared/services/http/helpers/params.dart';
import 'package:dictionary_challenge/app/core/shared/services/http/i_http_service.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/word_entity.dart';
import 'package:dictionary_challenge/app/features/home/domain/helpers/params/get_list_words_param.dart';
import 'package:dictionary_challenge/app/features/home/external/mappers/word_mapper.dart';
import 'package:dictionary_challenge/app/features/home/infra/datasources/i_get_list_words_datasource.dart';

class GetListWordsDatasource implements IGetListWordsDatasouce {
  final IHttpService _httpService;

  GetListWordsDatasource({
    required IHttpService httpService,
  }) : _httpService = httpService;

  @override
  Future<List<WordEntity>> call(GetListWordParam params) async {
    final responseApi = await _httpService.get(
      GetHttpServiceParam(
        url:
            'https://unrivaled-trifle-ef9836.netlify.app/.netlify/functions/api/words?offset=${params.initRange}&limit=${params.finalRange}',
      ),
    );
    final listData = List.from(responseApi.data);
    final result = listData.map((e) => WordMapper.fromMap(e)).toList();
    return result;
  }
}
