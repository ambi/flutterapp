import 'package:flutter/material.dart';
import 'package:flutterapp/data/word_favorites_repository.dart';
import 'package:flutterapp/presentation/layout_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var favorites = WordFavoritesRepository();

    return MaterialApp(
      title: 'Namer App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: LayoutPage(favorites: favorites),
    );
  }
}
