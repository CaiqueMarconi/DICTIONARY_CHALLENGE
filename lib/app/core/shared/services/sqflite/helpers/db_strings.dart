class DbStrings {
  static const nameDb = 'dictionary.db';
  static const tableFavorites =
      'CREATE TABLE favorites (id INTEGER PRIMARY KEY AUTOINCREMENT, word VARCHAR )';
  static const tableHistory =
      'CREATE TABLE history (id INTEGER PRIMARY KEY AUTOINCREMENT, word VARCHAR, pronunciation VARCHAR, definition TEXT )';
  static const selectFieldsHistory =
      'SELECT word, pronunciation, definition FROM history ORDER BY id DESC';

  static const selectFieldsFavorites =
      'SELECT word FROM favorites ORDER BY id DESC';

  static const nameTableHistory = 'history';
  static const nameTableFavorite = 'favorites';
}
