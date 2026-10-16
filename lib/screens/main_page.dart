import 'package:flutter/material.dart';
import 'package:cat_shelter/widgets/cat_card.dart';

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
                name: "Барсик",
                age: 3,
                description: "Ласковый и игривый котик. Очень любит спать.",
              ),
              CatCard(
                name: "Мурзик",
                age: 5,
                description: "Спокойный и добрый.",
              ),
              CatCard(name: "Рыжик", age: 1, description: "Энергичный котик."),
              CatCard(
                name: "Его котейшество Барсик Великолепный Первый",
                age: 1,
                description: "Самый важный кот нашего приюта.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
