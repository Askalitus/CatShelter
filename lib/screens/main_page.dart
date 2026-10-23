import 'package:cat_shelter/screens/cat_detail_page.dart';
import 'package:cat_shelter/widgets/empty_favorites.dart';
import 'package:flutter/material.dart';

import 'package:cat_shelter/widgets/cat_list.dart';
import 'package:cat_shelter/data/mock_cats.dart';
import 'package:cat_shelter/widgets/cat_grid.dart';
import 'package:cat_shelter/models/cat.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isGridView = false;
  bool showFavoritesOnly = false;
  final Set<String> favoriteCatIds = {};

  void toggleView() {
    setState(() {
      isGridView = !isGridView;
    });
  }

  void toggleFavoritesFilter() {
    setState(() {
      showFavoritesOnly = !showFavoritesOnly;
    });
  }

  void toggleFavorite(String catId) {
    setState(() {
      if (favoriteCatIds.contains(catId)) {
        favoriteCatIds.remove(catId);
      } else {
        favoriteCatIds.add(catId);
      }
    });
  }

  Future<void> openCatDetails(Cat cat) async {
    final bool? result = await Navigator.of(context).push(
      MaterialPageRoute<bool>(builder: (context) => CatDetailPage(cat: cat)),
    );

    if (!mounted || result == null || !result) {
      return;
    }
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Вы выбрали ${cat.name} для знакомства!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Cat> visibleCats = showFavoritesOnly
        ? mockCats.where((cat) => favoriteCatIds.contains(cat.id)).toList()
        : mockCats;

    return Scaffold(
      appBar: AppBar(
        title: Text('Кошачий приют'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isGridView ? Icons.view_list : Icons.grid_view),
            tooltip: isGridView ? 'Показать списком' : 'Показать сеткой',
            onPressed: toggleView,
          ),
          IconButton(
            icon: Icon(showFavoritesOnly ? Icons.pets : Icons.favorite),
            tooltip: showFavoritesOnly
                ? 'Показать всех котиков'
                : 'Показать избранных котиков',
            onPressed: toggleFavoritesFilter,
          ),
        ],
      ),
      body: showFavoritesOnly && visibleCats.isEmpty
          ? EmptyFavorites(onShowAll: () => toggleFavoritesFilter())
          : isGridView
          ? CatGrid(
              cats: visibleCats,
              favoriteCatIds: favoriteCatIds,
              onFavoriteToggle: toggleFavorite,
              onCatTap: openCatDetails,
            )
          : CatList(
              cats: visibleCats,
              favoriteCatIds: favoriteCatIds,
              onFavoriteToggle: toggleFavorite,
              onCatTap: openCatDetails,
              title: showFavoritesOnly
                  ? 'Избранные котики (${visibleCats.length})'
                  : 'Наши котики (${visibleCats.length})',
            ),
    );
  }
}
