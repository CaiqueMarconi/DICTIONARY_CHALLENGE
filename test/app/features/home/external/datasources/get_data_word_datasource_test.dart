import 'package:dictionary_challenge/app/core/shared/services/http/helpers/params.dart';
import 'package:dictionary_challenge/app/core/shared/services/http/helpers/responses.dart';
import 'package:dictionary_challenge/app/core/shared/services/http/i_http_service.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/data_word_entity.dart';
import 'package:dictionary_challenge/app/features/home/domain/helpers/params/get_data_word_param.dart';
import 'package:dictionary_challenge/app/features/home/external/datasources/get_data_word_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mock_params/response_data_word_mock.dart';

class HttpMock extends Mock implements IHttpService {}

class GetHttpParamFake extends Fake implements GetHttpServiceParam {}

void main() {
  final http = HttpMock();
  final datasource = GetDataWordDatasource(httpService: http);

  setUpAll(() {
    registerFallbackValue(GetHttpParamFake());
  });

  test('get data word datasource ...', () async {
    when(() => http.get(any())).thenAnswer((invocation) async =>
        GetHttpServiceResponse(data: responseDataWordMock));
    final result = await datasource.call(GetDataWordParam(word: ''));
    expect(result, isA<DataWordEntity>());
  });
}
