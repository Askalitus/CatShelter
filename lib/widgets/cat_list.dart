import 'package:flutter/material.dart';
import 'package:cat_shelter/widgets/cat_card.dart';
import 'package:cat_shelter/models/cat.dart';

class CatList extends StatelessWidget {
  final List<Cat> cats;

  const CatList({super.key, required this.cats});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Text(
            'Наши котики (${cats.length})',
            style: textTheme.headlineMedium,
            textAlign: TextAlign.center,
          );
        }
        final cat = cats[index - 1];
        return CatCard(cat: cat);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: cats.length + 1,
    );
  }
}
