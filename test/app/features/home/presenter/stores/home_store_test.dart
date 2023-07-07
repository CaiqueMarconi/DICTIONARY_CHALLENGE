import 'package:dartz/dartz.dart';
import 'package:dictionary_challenge/app/core/shared/services/sqflite/i_sqflite_service.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/data_word_entity.dart';
import 'package:dictionary_challenge/app/features/home/domain/helpers/enum/menu_title_enum.dart';
import 'package:dictionary_challenge/app/features/home/domain/usecases/get_data_word_usecase/i_get_data_word_usecase.dart';
import 'package:dictionary_challenge/app/features/home/domain/usecases/get_list_words_usecase/i_get_list_words_usecase.dart';
import 'package:dictionary_challenge/app/features/home/presenter/stores/home_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:triple_test/triple_test.dart';

import '../../../../../mock_params/app_exception_mock.dart';
import '../../../../../mock_params/get_data_word_param_mock.dart';
import '../../../../../mock_params/get_list_words_param_mock.dart';

class GetListWordsUsecaseMock extends Mock implements IGetListWordsUsecase {}

class GetDataWordUsecaseMock extends Mock implements IGetDataWordUsecase {}

class SqfliteServiceMock extends Mock implements ISqfliteService {}

void main() {
  late HomeStore store;
  final getListWordsUsecase = GetListWordsUsecaseMock();
  final getDataWordUsecase = GetDataWordUsecaseMock();
  final sqfliteService = SqfliteServiceMock();
  setUp(() {
    store = HomeStore(
      getListWordsUsecase: getListWordsUsecase,
      getDataWordUsecase: getDataWordUsecase,
      sqfliteService: sqfliteService,
    );
  });
  storeTest<HomeStore>(
    'Testing method getListWord case success',
    build: () {
      when(() => getListWordsUsecase.call(getlistWordParamMock))
          .thenAnswer((invocation) async => const Right([]));
      return store;
    },
    act: (store) => store.getListWord(getlistWordParamMock),
    expect: () => [tripleState],
  );

  storeTest<HomeStore>(
    'Testing method getListWord case failure',
    build: () {
      when(() => getListWordsUsecase.call(getlistWordParamMock))
          .thenAnswer((invocation) async => Left(appExceptionMock));
      return store;
    },
    act: (store) => store.getListWord(getlistWordParamMock),
    expect: () => [tripleError],
  );

  storeTest<HomeStore>(
    'Testing method getDataWord case success',
    build: () {
      when(() => getDataWordUsecase.call(getDataWordParamMock))
          .thenAnswer((invocation) async => Right(DataWordEntity(word: '')));
      return store;
    },
    act: (store) => store.getDataWord(getDataWordParamMock),
    expect: () => [tripleState],
  );

  storeTest<HomeStore>(
    'Testing method getDataWord case failure',
    build: () {
      when(() => getDataWordUsecase.call(getDataWordParamMock))
          .thenAnswer((invocation) async => Left(appExceptionMock));
      return store;
    },
    act: (store) => store.getDataWord(getDataWordParamMock),
    expect: () => [tripleError],
  );

  storeTest<HomeStore>(
    'Testing method initDataWord case success',
    build: () {
      return store;
    },
    act: (store) => store.initDataWord(),
    expect: () => [tripleState],
  );

  storeTest<HomeStore>(
    'Testing method setListWord case success',
    build: () {
      return store;
    },
    act: (store) => store.setListWord([]),
    expect: () => [tripleState],
  );

  storeTest<HomeStore>(
    'Testing method setMenuOption case success',
    build: () {
      return store;
    },
    act: (store) => store.setMenuOption(MenuTitleEnum.favorites),
    expect: () => [tripleState],
  );
}
