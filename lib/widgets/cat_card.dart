import 'package:flutter/material.dart';

import 'package:cat_shelter/models/cat.dart';
import 'package:cat_shelter/utils/age_formatter.dart';

class CatCard extends StatelessWidget {
  final Cat cat;

  const CatCard({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

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
              children: [
                Icon(color: colors.primary, Icons.pets),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cat.name,
                        style: Theme.of(context).textTheme.titleLarge
                            ?.copyWith(color: colors.onSurface),
                      ),
                      Text(
                        'Возраст: ${formatCatAge(cat.age)}',
                        style: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(color: colors.onSurface),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              cat.description,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium
                  ?.copyWith(color: colors.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}
