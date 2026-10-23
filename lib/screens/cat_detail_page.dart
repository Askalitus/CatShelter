import 'package:flutter/material.dart';
import 'package:cat_shelter/models/cat.dart';
import 'package:cat_shelter/utils/age_formatter.dart';

class CatDetailPage extends StatelessWidget {
  final Cat cat;

  const CatDetailPage({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(cat.name), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Row(
                spacing: 8,
                children: [
                  Icon(Icons.pets, color: colorScheme.primary),
                  Expanded(
                    child: Text(cat.name, style: textTheme.headlineMedium),
                  ),
                ],
              ),
              Text(
                'Возраст: ${formatCatAge(cat.age)}',
                style: textTheme.bodyMedium,
              ),
              Text(cat.description, style: textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
