import 'package:flutter/material.dart';

import 'package:cat_shelter/widgets/cat_list.dart';
import 'package:cat_shelter/data/mock_cats.dart';
import 'package:cat_shelter/widgets/cat_grid.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isGridView = false;
  final Set<String> favoriteCatIds = {};

  void toggleView() {
    setState(() {
      isGridView = !isGridView;
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

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
      body: isGridView
          ? CatGrid(
              cats: mockCats,
              favoriteCatIds: favoriteCatIds,
              onFavoriteToggle: toggleFavorite,
            )
          : CatList(
              cats: mockCats,
              favoriteCatIds: favoriteCatIds,
              onFavoriteToggle: toggleFavorite,
            ),
    );
  }
}
