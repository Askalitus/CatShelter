import 'package:flutter/material.dart';

class EmptyFavorites extends StatelessWidget {
  final VoidCallback onShowAll;

  const EmptyFavorites({super.key, required this.onShowAll});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 24,
          children: [
            const Icon(Icons.favorite_border),
            Column(
              spacing: 12,
              children: [
                Text('Пока нет избранных котиков', style: textTheme.titleLarge),
                Text(
                  'Нажмите на сердечко у понравившегося котика, чтобы добавить его сюда.',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => onShowAll(),
              child: Text('Все котики'),
            ),
          ],
        ),
      ),
    );
  }
}
