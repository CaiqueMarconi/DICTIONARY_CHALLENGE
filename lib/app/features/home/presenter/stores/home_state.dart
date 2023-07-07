import 'package:dictionary_challenge/app/features/home/domain/entities/data_word_entity.dart';
import 'package:dictionary_challenge/app/features/home/domain/entities/word_entity.dart';
import 'package:dictionary_challenge/app/features/home/domain/helpers/enum/menu_title_enum.dart';

class HomeState {
  final List<WordEntity> listWords;
  final List<DataWordEntity> listWordsFavorites;
  final List<DataWordEntity> listWordsHistory;
  final DataWordEntity? dataWord;
  final MenuTitleEnum menuOption;
  HomeState({
    required this.listWords,
    required this.menuOption,
    this.dataWord,
    required this.listWordsFavorites,
    required this.listWordsHistory,
  });

  factory HomeState.init() => HomeState(
        listWords: [],
        menuOption: MenuTitleEnum.word,
        listWordsFavorites: [],
        listWordsHistory: [],
      );

  HomeState copyWith({
    List<WordEntity>? listWords,
    DataWordEntity? dataWord,
    MenuTitleEnum? menuOption,
    List<DataWordEntity>? listWordsFavorites,
    List<DataWordEntity>? listWordsHistory,
  }) {
    return HomeState(
      listWords: listWords ?? this.listWords,
      dataWord: dataWord ?? this.dataWord,
      menuOption: menuOption ?? this.menuOption,
      listWordsFavorites: listWordsFavorites ?? this.listWordsFavorites,
      listWordsHistory: listWordsHistory ?? this.listWordsHistory,
    );
  }
}
