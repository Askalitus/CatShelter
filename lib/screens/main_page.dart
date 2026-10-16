import 'package:flutter/material.dart';

import 'package:cat_shelter/widgets/cat_card.dart';
import 'package:cat_shelter/models/cat.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Кошачий приют'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              Text(
                style: Theme.of(context).textTheme.headlineMedium,
                "Наши котики",
              ),
              CatCard(
                cat: const Cat(
                  id: "1",
                  name: "Барсик",
                  age: 3,
                  description: "Ласковый и игривый котик. Очень любит спать.",
                ),
              ),
              CatCard(
                cat: const Cat(
                  id: "2",
                  name: "Мурзик",
                  age: 5,
                  description: "Спокойный и добрый.",
                ),
              ),
              CatCard(
                cat: const Cat(
                  id: "3",
                  name: "Рыжик",
                  age: 1,
                  description: "Энергичный котик.",
                ),
              ),
              CatCard(
                cat: const Cat(
                  id: "4",
                  name: "Его котейшество Барсик Великолепный Первый",
                  age: 1,
                  description: "Самый важный кот нашего приюта.",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
