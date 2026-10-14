import 'package:flutter/material.dart';

import 'package:cat_shelter/screens/main_page.dart';

void main() {
  runApp(const CatShelterApp());
}

class CatShelterApp extends StatelessWidget {
  const CatShelterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MainPage());
  }
}
