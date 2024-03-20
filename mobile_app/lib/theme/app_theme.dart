import 'package:chat_app/theme/colors.dart';
import 'package:chat_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const inputHeight =
      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0);
  static final inputBorderRadius = BorderRadius.circular(5);

  static final darkTheme = ThemeData(
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: inputHeight,
          enabledBorder: OutlineInputBorder(
            borderRadius: inputBorderRadius,
            borderSide: BorderSide(color: AppColors.darkColorScheme.tertiary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: inputBorderRadius,
            borderSide: BorderSide(color: AppColors.darkColorScheme.primary),
          )),
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'Poppins',
      colorScheme: AppColors.darkColorScheme,
      textTheme: AppTextTheme.dark);

  static final lightTheme = ThemeData(
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: inputHeight,
          enabledBorder: OutlineInputBorder(
            borderRadius: inputBorderRadius,
            borderSide: BorderSide(color: AppColors.lightColorScheme.tertiary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: inputBorderRadius,
            borderSide: BorderSide(color: AppColors.lightColorScheme.primary),
          )),
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      colorScheme: AppColors.lightColorScheme,
      textTheme: AppTextTheme.light);
}
