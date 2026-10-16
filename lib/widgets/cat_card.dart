import 'package:flutter/material.dart';

class CatCard extends StatelessWidget {
  final String name;
  final int age;
  final String description;

  const CatCard({
    super.key,
    required this.name,
    required this.age,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
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
                        name,
                        style: Theme.of(context).textTheme.titleLarge
                            ?.copyWith(color: colors.onSurface),
                      ),
                      Text(
                        'Возраст: $age года',
                        style: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(color: colors.onSurface),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              description,
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
