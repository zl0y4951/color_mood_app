import 'package:color_mood_app/src/core/theme/theme_data.dart';
import 'package:color_mood_app/src/feature/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.main,
      home: const HomeScreen(),
    );
  }
}
