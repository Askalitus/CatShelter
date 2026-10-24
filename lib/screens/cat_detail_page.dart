import 'package:flutter/material.dart';
import 'package:cat_shelter/models/cat.dart';
import 'package:cat_shelter/utils/age_formatter.dart';

class CatDetailPage extends StatefulWidget {
  final Cat cat;

  const CatDetailPage({super.key, required this.cat});

  @override
  State<CatDetailPage> createState() => _CatDetailPage();
}

class _CatDetailPage extends State<CatDetailPage> {
  final TextEditingController nameController = TextEditingController();
  String? nameError;

  void confirmIntroduction() {
    final String inputText = nameController.text.trim();

    if (inputText.isEmpty) {
      setState(() {
        nameError = 'Введите ваше имя';
      });
      return;
    }

    Navigator.of(context).pop<String>(inputText);
  }

  void onChangeName(String value) {
    setState(() {
      if (nameError != null) {
        nameError = null;
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final cat = widget.cat;

    return Scaffold(
      appBar: AppBar(title: Text(cat.name), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 16,
          children: [
            Expanded(
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
                          child: Text(
                            cat.name,
                            style: textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Возраст: ${formatCatAge(cat.age)}',
                      style: textTheme.bodyMedium,
                    ),
                    Text(cat.description, style: textTheme.bodyMedium),
                    TextField(
                      controller: nameController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        labelText: 'Ваше имя',
                        hintText: 'Как к вам обращаться?',
                        border: const OutlineInputBorder(),
                        errorText: nameError,
                      ),
                      onChanged: onChangeName,
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: confirmIntroduction,
              child: Text('Хочу познакомиться'),
            ),
          ],
        ),
      ),
    );
  }
}
