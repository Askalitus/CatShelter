import 'package:flutter/material.dart';

import 'package:cat_shelter/widgets/cat_card.dart';
import 'package:cat_shelter/models/cat.dart';

class CatGrid extends StatelessWidget {
  final List<Cat> cats;

  const CatGrid({super.key, required this.cats});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 350,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        mainAxisExtent: 280,
      ),
      itemBuilder: (context, index) {
        return CatCard(cat: cats[index]);
      },
      itemCount: cats.length,
    );
  }
}
