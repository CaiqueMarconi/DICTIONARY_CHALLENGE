import 'package:dartz/dartz.dart';
import 'package:dictionary_challenge/app/core/shared/failures/app_failure/i_app_failure.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/data_word_entity.dart';
import 'package:dictionary_challenge/app/features/home/infra/datasources/i_get_data_word_datasource.dart';
import 'package:dictionary_challenge/app/features/home/infra/repositories/get_data_word_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mock_params/app_exception_mock.dart';
import '../../../../../mock_params/get_data_word_param_mock.dart';

class GetDataWordDatasourceMock extends Mock
    implements IGetDataWordDatasource {}

void main() {
  final datasource = GetDataWordDatasourceMock();
  final repository = GetDataWordRepository(datasource);
  test('get data word repository ...', () async {
    when(() => datasource.call(getDataWordParamMock)).thenAnswer(
      (invocation) async => DataWordEntity(
        word: 'word',
        pronunciation: 'pronunciation',
        definition: 'definition',
      ),
    );
    final result = await repository.call(getDataWordParamMock);
    expect(result.fold(id, id), isA<DataWordEntity>());
  });

  test('get data word repository Failure...', () async {
    when(() => datasource.call(getDataWordParamMock))
        .thenThrow(appExceptionMock);
    final result = await repository.call(getDataWordParamMock);
    expect(result.fold(id, id), isA<IAppFailure>());
  });
}
