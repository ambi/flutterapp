import 'package:flutter/material.dart';
import 'package:flutterapp/data/word_favorites_repository.dart';

class FavoritesPage extends StatelessWidget {
  final WordFavoritesRepository favorites;

  const FavoritesPage({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    if (favorites.length() == 0) {
      return const Center(child: Text('No favorites yet.'));
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have ${favorites.length()} favorites:'),
        ),
        for (var word in favorites.toIterable())
          ListTile(
            leading: const Icon(Icons.favorite),
            title: Text(word),
          )
      ],
    );
  }
}
