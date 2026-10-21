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

  void toggleView() {
    setState(() {
      isGridView = !isGridView;
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
      body: isGridView ? CatGrid(cats: mockCats) : CatList(cats: mockCats),
    );
  }
}
