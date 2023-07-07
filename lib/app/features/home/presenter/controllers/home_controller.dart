// ignore_for_file: use_build_context_synchronously

import 'package:dictionary_challenge/app/core/shared/services/snack_bar/i_snack_bar_service.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/data_word_entity.dart';
import 'package:dictionary_challenge/app/features/home/domain/helpers/enum/menu_title_enum.dart';
import 'package:dictionary_challenge/app/features/home/presenter/methods/save_local_string/helpers/get_local_param.dart';
import 'package:dictionary_challenge/app/features/home/presenter/methods/save_local_string/helpers/save_local_param.dart';
import 'package:dictionary_challenge/app/features/home/presenter/methods/save_local_string/save_local_string.dart';
import 'package:dictionary_challenge/app/features/home/presenter/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/word_entity.dart';
import '../../domain/helpers/params/get_data_word_param.dart';
import '../../domain/helpers/params/get_list_words_param.dart';
import '../methods/save_local_string/helpers/static_key_preferences.dart';
import '../stores/home_state.dart';
import '../widgets/dialog_delete_favorite_word.dart';
import '../widgets/dialog_wanna_favorite.dart';

class HomeController {
  final HomeStore _homeStore;
  final ISnackBarService _snackBarService;

  HomeController({
    required HomeStore homeStore,
    required ISnackBarService snackBarService,
  })  : _homeStore = homeStore,
        _snackBarService = snackBarService;

  HomeStore get store => _homeStore;
  HomeState get state => _homeStore.state;

  Future<bool> callViewDataWordPage(String word) async {
    await _homeStore.getDataWord(
      GetDataWordParam(word: word),
    );
    if (state.dataWord == null || word != state.dataWord!.word) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> loadMenuList(MenuTitleEnum menuTitle) async {
    if (menuTitle == MenuTitleEnum.favorites) {
      await _homeStore.getListWordFavorites();
    } else if (menuTitle == MenuTitleEnum.history) {
      await _homeStore.getListWordHistorys();
    }
  }

  Future<void> saveWordInHistory(DataWordEntity dataWord) async {
    await _homeStore.getListWordHistorys();
    if (state.listWordsHistory
        .where((element) => element.word == dataWord.word)
        .isEmpty) {
      await _homeStore.saveWordHistory(dataWord);
    }
  }

  Future<bool> saveWordInFavorite(WordEntity word) async {
    await _homeStore.getListWordFavorites();
    final alreadyFavorited = state.listWordsFavorites
        .where((element) => element.word == word.word)
        .isEmpty;
    if (alreadyFavorited) {
      await _homeStore.saveWordFavorite(word);
      return alreadyFavorited;
    } else {
      return alreadyFavorited;
    }
  }

  Future<void> deleteFavoriteWord(WordEntity word) async {
    await _homeStore.deleteFavoriteWord(word);
    await _homeStore.getListWordFavorites();
  }

  Future<void> saveInitListWords() async {
    await SaveLocalString.saveLocalListString(
      SaveLocalParam(
          key: StaticKeyPreferences.keyPreferences,
          itemsToSave:
              state.listWords.sublist(0, 70).map((e) => e.word).toList()),
    );
  }

  Future<void> getInitListWords() async {
    final listWords = await SaveLocalString.getItems(
        GetLocalParam(key: StaticKeyPreferences.keyPreferences));
    if (listWords != null) {
      _homeStore.setListWord(
          listWords.map((e) => WordEntity(word: e!.item)).toList());
    }
  }

  Future<void> loadListWord() async {
    await getInitListWords();
    if (state.listWords.isEmpty) {
      await _homeStore
          .getListWord(GetListWordParam(initRange: 0, finalRange: 120));
      await saveInitListWords();
    } else {
      await _homeStore.getListWord(
          GetListWordParam(initRange: state.listWords.length, finalRange: 300));
      await saveInitListWords();
    }
  }

  void showSnackBar(String message) {
    _snackBarService.show(message: message);
  }

  Future<void> fluxOnlongPressGridView(
    bool enableOnLongPress,
    BuildContext context,
    WordEntity word,
  ) async {
    if (!enableOnLongPress) {
      null;
    } else if (enableOnLongPress && state.menuOption == MenuTitleEnum.word) {
      dialogWannaFavorite(context, setWordFavorite: () async {
        final alreadyFavorite = await saveWordInFavorite(word);
        if (alreadyFavorite) {
          showSnackBar('Palavra adicionada a aba de favoritos');
        } else {
          showSnackBar('A Palavra ja esta em sua lista de favoritos');
        }
      });
    } else if (enableOnLongPress &&
        state.menuOption == MenuTitleEnum.favorites) {
      dialogDeleteFavoriteWord(
        context,
        deleteWordFavorite: () async => await deleteFavoriteWord(word),
      );
    }
  }

  Future<void> fluxViewDetailsWord(
    BuildContext context,
    WordEntity word,
  ) async {
    await _homeStore.getListWordHistorys();
    late DataWordEntity dataWord;
    bool hasData = false;
    final wordHistory =
        state.listWordsHistory.where((e) => e.word == word.word);
    if (wordHistory.isEmpty) {
      hasData = await callViewDataWordPage(
        word.word,
      );
      if (hasData) {
        dataWord = state.dataWord!;
      }
    } else {
      hasData = true;
      dataWord = wordHistory.first;
    }
    if (!hasData) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      showSnackBar('Não foi possivel localizar a palavra na base de dados');
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      await saveWordInHistory(dataWord);

      Modular.to.pushNamed('/view_word', arguments: {'dataWord': dataWord});
    }
  }
}
