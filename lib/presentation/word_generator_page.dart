import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/data/word_favorites_repository.dart';
import 'package:flutterapp/presentation/big_card.dart';
import 'package:flutterapp/presentation/like_word_button.dart';
import 'package:provider/provider.dart';

class WordGeneratorPage extends StatelessWidget {
  const WordGeneratorPage({super.key, required this.favorites});

  final WordFavoritesRepository favorites;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<NameGeneratorStore>();
    final word = appState.current;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(content: word),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              LikeWordButton(word: word, favorites: favorites),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NameGeneratorStore extends ChangeNotifier {
  var current = WordPair.random().asLowerCase;

  void getNext() {
    current = WordPair.random().asLowerCase;
    notifyListeners();
  }
}
