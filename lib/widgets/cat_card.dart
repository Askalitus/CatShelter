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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.pets), Text(name)],
            ),
            Text('Возраст: $age года'),
            Text(description, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
