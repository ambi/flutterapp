import 'package:flutter/material.dart';
import 'package:flutterapp/data/word_favorites_repository.dart';
import 'package:flutterapp/presentation/favorites_page.dart';
import 'package:flutterapp/presentation/word_generator_page.dart';

class LayoutPage extends StatefulWidget {
  final WordFavoritesRepository favorites;

  const LayoutPage({super.key, required this.favorites});

  @override
  State<LayoutPage> createState() => NamerPageState(favorites);
}

class NamerPageState extends State<LayoutPage> {
  NamerPageState(this.favorites);

  final WordFavoritesRepository favorites;
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = WordGeneratorPage(favorites: favorites);
        break;
      case 1:
        page = FavoritesPage(favorites: favorites);
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorite'),
                  )
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}
