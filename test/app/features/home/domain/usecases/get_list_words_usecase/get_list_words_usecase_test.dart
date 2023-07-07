import 'package:dartz/dartz.dart';
import 'package:dictionary_challenge/app/core/shared/failures/app_failure/i_app_failure.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/word_entity.dart';
import 'package:dictionary_challenge/app/features/home/domain/repositories/i_get_list_words_repository.dart';
import 'package:dictionary_challenge/app/features/home/domain/usecases/get_list_words_usecase/get_list_words_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../mock_params/app_exception_mock.dart';
import '../../../../../../mock_params/get_list_words_param_mock.dart';

class GetListWordsRepositoryMock extends Mock
    implements IGetListWordsRepository {}

void main() {
  final repository = GetListWordsRepositoryMock();
  final usecase = GetListWordUsecase(repository);

  test('get list words usecase ...', () async {
    when(() => repository.call(getlistWordParamMock))
        .thenAnswer((invocation) async => Right([WordEntity(word: 'word')]));
    final result = await usecase.call(getlistWordParamMock);
    expect(result.fold(id, id), isA<List<WordEntity>>());
  });

  test('get list words usecase Failure...', () async {
    when(() => repository.call(getlistWordParamMock))
        .thenAnswer((invocation) async => Left(appExceptionMock));
    final result = await usecase.call(getlistWordParamMock);
    expect(result.fold(id, id), isA<IAppFailure>());
  });
}
