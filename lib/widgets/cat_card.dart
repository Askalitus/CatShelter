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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.pets),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight(500),
                        ),
                      ),
                      Text('Возраст: $age года'),
                    ],
                  ),
                ),
              ],
            ),
            Text(description, textAlign: TextAlign.start),
          ],
        ),
      ),
    );
  }
}
