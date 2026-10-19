import 'package:flutter/material.dart';

import 'package:cat_shelter/widgets/cat_card.dart';
import 'package:cat_shelter/data/mock_cats.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text('Кошачий приют'), centerTitle: true),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Text(
              'Наши котики (${mockCats.length})',
              style: textTheme.headlineMedium,
              textAlign: TextAlign.center,
            );
          }
          final cat = mockCats[index - 1];
          return CatCard(cat: cat);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: mockCats.length + 1,
      ),
    );
  }
}
