import 'package:dictionary_challenge/app/core/shared/failures/app_failure/i_app_failure.dart';
import 'package:dictionary_challenge/app/core/shared/services/sqflite/helpers/db_strings.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/data_word_entity.dart';
import 'package:dictionary_challenge/app/features/home/domain/helpers/params/get_data_word_param.dart';
import 'package:dictionary_challenge/app/features/home/domain/helpers/params/get_list_words_param.dart';
import 'package:dictionary_challenge/app/features/home/domain/usecases/get_data_word_usecase/i_get_data_word_usecase.dart';
import 'package:dictionary_challenge/app/features/home/domain/usecases/get_list_words_usecase/i_get_list_words_usecase.dart';
import 'package:dictionary_challenge/app/features/home/presenter/stores/home_state.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../core/shared/services/sqflite/i_sqflite_service.dart';
import '../../domain/entities/word_entity.dart';
import '../../domain/helpers/enum/menu_title_enum.dart';

class HomeStore extends StreamStore<IAppFailure, HomeState> {
  final IGetListWordsUsecase _getListWordsUsecase;
  final IGetDataWordUsecase _getDataWordUsecase;
  final ISqfliteService _sqfliteService;

  HomeStore({
    required IGetListWordsUsecase getListWordsUsecase,
    required IGetDataWordUsecase getDataWordUsecase,
    required ISqfliteService sqfliteService,
  })  : _getListWordsUsecase = getListWordsUsecase,
        _getDataWordUsecase = getDataWordUsecase,
        _sqfliteService = sqfliteService,
        super(HomeState.init());

  Future<void> getListWord(GetListWordParam param) async {
    final result = await _getListWordsUsecase.call(param);
    result.fold(
      (l) => setError(l),
      (r) => update(state.copyWith(listWords: state.listWords + r)),
    );
  }

  Future<void> getDataWord(GetDataWordParam param) async {
    final result = await _getDataWordUsecase.call(param);
    result.fold(
      (l) => setError(l),
      (r) => update(state.copyWith(dataWord: r)),
    );
  }

  void initDataWord() {
    update(state.copyWith(dataWord: null));
  }

  void setListWord(List<WordEntity> listWord) {
    update(state.copyWith(listWords: listWord));
  }

  void setMenuOption(MenuTitleEnum menuTitle) {
    update(state.copyWith(menuOption: menuTitle));
  }

  Future<void> createDb() async {
    await _sqfliteService.createDbLocal();
  }

  Future<void> getListWordFavorites() async {
    final list = await _sqfliteService.getListWordDb(
      sql: DbStrings.selectFieldsFavorites,
    );
    update(state.copyWith(listWordsFavorites: list));
  }

  Future<void> getListWordHistorys() async {
    final list = await _sqfliteService.getListWordDb(
      sql: DbStrings.selectFieldsHistory,
    );
    update(state.copyWith(listWordsHistory: list));
  }

  Future<void> saveWordHistory(DataWordEntity dataWord) async {
    await _sqfliteService.saveDataWordDb(
      dataWord: dataWord,
      table: DbStrings.nameTableHistory,
    );
  }

  Future<void> saveWordFavorite(WordEntity dataWord) async {
    await _sqfliteService.saveWordDb(
      word: dataWord,
      table: DbStrings.nameTableFavorite,
    );
  }

  Future<void> deleteFavoriteWord(WordEntity word) async {
    await _sqfliteService.deleteItemDb(
      word: word.word,
      table: DbStrings.nameTableFavorite,
    );
  }
}
