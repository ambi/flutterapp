import 'package:flutter/material.dart';
import 'package:flutterapp/data/word_favorites_repository.dart';

class LikeWordButton extends StatelessWidget {
  const LikeWordButton({
    super.key,
    required this.word,
    required this.favorites,
  });

  final String word;
  final WordFavoritesRepository favorites;

  @override
  Widget build(BuildContext context) {
    var liked = favorites.contains(word);
    IconData icon;
    if (liked) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return ElevatedButton.icon(
      onPressed: () {
        if (liked) {
          favorites.remove(word);
        } else {
          favorites.add(word);
        }
      },
      icon: Icon(icon),
      label: const Text('Like'),
    );
  }
}
