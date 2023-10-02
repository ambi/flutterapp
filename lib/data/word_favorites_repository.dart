class WordFavoritesRepository {
  var favorites = <String>[];

  void add(String word) {
    if (contains(word)) return;

    favorites.add(word);
  }

  void remove(String word) {
    if (!contains(word)) return;

    favorites.remove(word);
  }

  bool contains(String word) {
    return favorites.contains(word);
  }

  int length() {
    return favorites.length;
  }

  Iterable<String> toIterable() {
    return favorites;
  }
}
