enum MenuTitleEnum {
  word,
  history,
  favorites,
}

extension MenuTitleEnumExtension on MenuTitleEnum {
  static String convertEnumToString(MenuTitleEnum menuTitleEnum) {
    if (menuTitleEnum == MenuTitleEnum.word) {
      return 'Word list';
    } else if (menuTitleEnum == MenuTitleEnum.favorites) {
      return 'Favorites';
    } else {
      return 'History';
    }
  }
}
