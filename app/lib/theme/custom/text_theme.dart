import 'package:flutter/material.dart';

class AppTextTheme {
  static const darkTextColor = Color(0xffc6c8cd);
  static const lightTextColor = Color(0xff212529);

  static final dark = TextTheme(
      headlineLarge: const TextStyle().copyWith(
          fontSize: 32.0, fontWeight: FontWeight.bold, color: darkTextColor),
      headlineMedium: const TextStyle().copyWith(
          fontSize: 24.0, fontWeight: FontWeight.w600, color: darkTextColor),
      headlineSmall: const TextStyle().copyWith(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: darkTextColor),
      titleLarge: const TextStyle().copyWith(
          fontSize: 16.0, fontWeight: FontWeight.w600, color: darkTextColor),
      titleMedium: const TextStyle().copyWith(
          fontSize: 16.0, fontWeight: FontWeight.w500, color: darkTextColor),
      titleSmall: const TextStyle().copyWith(
          fontSize: 16.0, fontWeight: FontWeight.w400, color: darkTextColor),
      bodyLarge: const TextStyle().copyWith(
          fontSize: 14.0, fontWeight: FontWeight.w500, color: darkTextColor),
      bodyMedium: const TextStyle().copyWith(
          fontSize: 14.0, fontWeight: FontWeight.normal, color: darkTextColor),
      bodySmall: const TextStyle().copyWith(
          fontSize: 14.0, fontWeight: FontWeight.w500, color: darkTextColor),
      labelLarge: const TextStyle().copyWith(
          fontSize: 12.0, fontWeight: FontWeight.normal, color: darkTextColor),
      labelMedium: const TextStyle().copyWith(
          fontSize: 12.0, fontWeight: FontWeight.normal, color: darkTextColor),
      labelSmall: const TextStyle().copyWith(
          fontSize: 12.0, fontWeight: FontWeight.normal, color: darkTextColor));

  static final light = dark;
}
