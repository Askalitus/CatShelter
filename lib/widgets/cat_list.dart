import 'package:flutter/material.dart';
import 'package:cat_shelter/widgets/cat_card.dart';
import 'package:cat_shelter/models/cat.dart';

class CatList extends StatelessWidget {
  final List<Cat> cats;
  final Set<String> favoriteCatIds;
  final ValueChanged<String> onFavoriteToggle;
  final ValueChanged<Cat> onCatTap;
  final String title;

  const CatList({
    super.key,
    required this.cats,
    required this.favoriteCatIds,
    required this.onFavoriteToggle,
    required this.onCatTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Text(
            title,
            style: textTheme.headlineMedium,
            textAlign: TextAlign.center,
          );
        }
        final cat = cats[index - 1];
        return CatCard(
          cat: cat,
          isFavorite: favoriteCatIds.contains(cat.id),
          onFavoriteToggle: () => onFavoriteToggle(cat.id),
          onTap: () => onCatTap(cat),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: cats.length + 1,
    );
  }
}
