import 'package:cat_shelter/models/introduction_request.dart';
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
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  void confirmIntroduction() {
    final isValid = formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    final String name = nameController.text.trim();
    final String email = emailController.text.trim();

    final IntroductionRequest result = IntroductionRequest(
      name: name,
      email: email,
    );

    Navigator.of(context).pop<IntroductionRequest>(result);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
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
                child: Form(
                  key: formKey,
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
                      TextFormField(
                        controller: nameController,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          labelText: 'Ваше имя',
                          hintText: 'Как к вам обращаться?',
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          final name = value?.trim() ?? '';

                          if (name.isEmpty || name.length < 2) {
                            return 'Некорректное имя';
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Электронная почта',
                          hintText: 'example@mail.com',
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          final email = value?.trim() ?? '';
                          final splitEmail = email.split('@');

                          if (email.isEmpty ||
                              splitEmail.length == 1 ||
                              splitEmail[0].isEmpty ||
                              splitEmail[1].isEmpty) {
                            return 'Некорректный email';
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
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
