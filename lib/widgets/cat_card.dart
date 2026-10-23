import 'package:flutter/material.dart';

import 'package:cat_shelter/models/cat.dart';
import 'package:cat_shelter/utils/age_formatter.dart';

class CatCard extends StatelessWidget {
  final Cat cat;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const CatCard({
    super.key,
    required this.cat,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      color: colors.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(color: colors.primary, Icons.pets),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cat.name,
                        style: textTheme.titleLarge?.copyWith(
                          color: colors.onSurface,
                        ),
                      ),
                      Text(
                        'Возраст: ${formatCatAge(cat.age)}',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? colors.primary : colors.onSurface,
                  ),
                  tooltip: isFavorite
                      ? 'Удалить из избранного'
                      : 'Добавить в избранное',
                  onPressed: onFavoriteToggle,
                ),
              ],
            ),
            Text(
              cat.description,
              textAlign: TextAlign.start,
              style: textTheme.bodyMedium?.copyWith(color: colors.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}
