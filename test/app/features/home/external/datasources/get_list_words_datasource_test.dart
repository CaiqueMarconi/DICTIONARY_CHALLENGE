import 'package:dictionary_challenge/app/core/shared/services/http/helpers/params.dart';
import 'package:dictionary_challenge/app/core/shared/services/http/helpers/responses.dart';
import 'package:dictionary_challenge/app/core/shared/services/http/i_http_service.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/word_entity.dart';
import 'package:dictionary_challenge/app/features/home/external/datasources/get_list_words_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mock_params/get_list_words_param_mock.dart';

class HttpMock extends Mock implements IHttpService {}

class GetHttpParamFake extends Fake implements GetHttpServiceParam {}

void main() {
  final http = HttpMock();
  final datasource = GetListWordsDatasource(httpService: http);

  setUpAll(() {
    registerFallbackValue(GetHttpParamFake());
  });

  test('get list words datasource ...', () async {
    when(() => http.get(any())).thenAnswer(
      (invocation) async => const GetHttpServiceResponse(data: [
        {"1": "chorepiscope"},
        {"1": "chorepiscopus"},
      ]),
    );
    final result = await datasource.call(getlistWordParamMock);
    expect(result, isA<List<WordEntity>>());
  });
}
