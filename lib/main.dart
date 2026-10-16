import 'package:flutter/material.dart';

import 'package:cat_shelter/screens/main_page.dart';
import 'package:cat_shelter/theme/app_theme.dart';

void main() {
  runApp(const CatShelterApp());
}

class CatShelterApp extends StatelessWidget {
  const CatShelterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.lightTheme, home: const MainPage());
  }
}
