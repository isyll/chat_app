import 'package:chat_app/theme/custom/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'Poppins',
      colorScheme: const ColorScheme.dark(
          onBackground: Color(0xffc6c8cd),
          background: Color(0xff1a2236),
          primary: Color(0xff0a80ff),
          secondary: Color(0xffc6c8cd)),
      textTheme: AppTextTheme.dark);

  static final lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      colorScheme: const ColorScheme.light(
          onBackground: Color(0xff212529),
          background: Colors.white,
          primary: Color(0xff0a80ff),
          secondary: Color(0xff212529)),
      textTheme: AppTextTheme.light);
}
