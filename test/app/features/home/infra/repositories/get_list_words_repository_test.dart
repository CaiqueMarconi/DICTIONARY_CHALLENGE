import 'package:dartz/dartz.dart';
import 'package:dictionary_challenge/app/core/shared/failures/app_failure/i_app_failure.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/word_entity.dart';
import 'package:dictionary_challenge/app/features/home/infra/datasources/i_get_list_words_datasource.dart';
import 'package:dictionary_challenge/app/features/home/infra/repositories/get_list_words_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mock_params/app_exception_mock.dart';
import '../../../../../mock_params/get_list_words_param_mock.dart';

class GetListWordsDatasourceMock extends Mock
    implements IGetListWordsDatasouce {}

void main() {
  final datasource = GetListWordsDatasourceMock();
  final usecase = GetListWordsRepository(datasource);

  test('get list words repository ...', () async {
    when(() => datasource.call(getlistWordParamMock))
        .thenAnswer((invocation) async => []);
    final result = await usecase.call(getlistWordParamMock);
    expect(result.fold(id, id), isA<List<WordEntity>>());
  });

  test('get list words repository Failure...', () async {
    when(() => datasource.call(getlistWordParamMock))
        .thenThrow(appExceptionMock);
    final result = await usecase.call(getlistWordParamMock);
    expect(result.fold(id, id), isA<IAppFailure>());
  });
}
