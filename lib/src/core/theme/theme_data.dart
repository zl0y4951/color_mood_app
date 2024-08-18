import 'package:color_mood_app/src/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // static final shadow = BoxShadow(
  //     color: CustomColors.primary.withOpacity(0.15),
  //     offset: const Offset(0, 1),
  //     blurStyle: BlurStyle.outer);

  static final main = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: CustomColors.black,
      selectedItemColor: CustomColors.purple,
      unselectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(size: 30),
      unselectedIconTheme: IconThemeData(size: 30),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w900,
        color: CustomColors.black,
      ),
    ),
  );
}
