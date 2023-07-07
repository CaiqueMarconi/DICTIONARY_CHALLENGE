import 'package:dartz/dartz.dart';
import 'package:dictionary_challenge/app/core/shared/failures/app_failure/i_app_failure.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/data_word_entity.dart';
import 'package:dictionary_challenge/app/features/home/domain/repositories/i_get_data_word_repository.dart';
import 'package:dictionary_challenge/app/features/home/domain/usecases/get_data_word_usecase/get_data_word_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../mock_params/app_exception_mock.dart';
import '../../../../../../mock_params/get_data_word_param_mock.dart';

class GetDataWordMock extends Mock implements IGetDataWordRepository {}

void main() {
  final repository = GetDataWordMock();
  final usecase = GetDataWordUsecase(repository);

  test('get data word usecase ...', () async {
    when(() => repository.call(getDataWordParamMock)).thenAnswer(
      (invocation) async => Right(
        DataWordEntity(
          word: 'word',
          pronunciation: 'pronunciation',
          definition: 'definition',
        ),
      ),
    );
    final result = await usecase.call(getDataWordParamMock);
    expect(result.fold(id, id), isA<DataWordEntity>());
  });

  test('get data word usecase Failure...', () async {
    when(() => repository.call(getDataWordParamMock)).thenAnswer(
      (invocation) async => Left(appExceptionMock),
    );
    final result = await usecase.call(getDataWordParamMock);
    expect(result.fold(id, id), isA<IAppFailure>());
  });
}
