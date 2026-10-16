import 'package:flutter/material.dart';

import 'package:cat_shelter/widgets/cat_card.dart';
import 'package:cat_shelter/data/mock_cats.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CatCard> cats = mockCats
        .map((cat) => CatCard(cat: cat))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text('Кошачий приют'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              Text(
                style: Theme.of(context).textTheme.headlineMedium,
                "Наши котики (${mockCats.length})",
              ),
              ...cats,
            ],
          ),
        ),
      ),
    );
  }
}
