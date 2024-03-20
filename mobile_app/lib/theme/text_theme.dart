import 'package:chat_app/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static final dark = TextTheme(
      headlineLarge: const TextStyle().copyWith(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: AppColors.darkColorScheme.onBackground),
      headlineMedium: const TextStyle().copyWith(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
          color: AppColors.darkColorScheme.onBackground),
      headlineSmall: const TextStyle().copyWith(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: AppColors.darkColorScheme.onBackground),
      titleLarge: const TextStyle().copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: AppColors.darkColorScheme.onBackground),
      titleMedium: const TextStyle().copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: AppColors.darkColorScheme.onBackground),
      titleSmall: const TextStyle().copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: AppColors.darkColorScheme.onBackground),
      bodyLarge: const TextStyle().copyWith(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: AppColors.darkColorScheme.onBackground),
      bodyMedium: const TextStyle().copyWith(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
          color: AppColors.darkColorScheme.onBackground),
      bodySmall: const TextStyle().copyWith(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: AppColors.darkColorScheme.onBackground),
      labelLarge: const TextStyle().copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: AppColors.darkColorScheme.onBackground),
      labelMedium: const TextStyle().copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: AppColors.darkColorScheme.onBackground),
      labelSmall: const TextStyle().copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: AppColors.darkColorScheme.onBackground));

  static final light = TextTheme(
      headlineLarge: const TextStyle().copyWith(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: AppColors.lightColorScheme.onBackground),
      headlineMedium: const TextStyle().copyWith(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
          color: AppColors.lightColorScheme.onBackground),
      headlineSmall: const TextStyle().copyWith(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: AppColors.lightColorScheme.onBackground),
      titleLarge: const TextStyle().copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: AppColors.lightColorScheme.onBackground),
      titleMedium: const TextStyle().copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: AppColors.lightColorScheme.onBackground),
      titleSmall: const TextStyle().copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: AppColors.lightColorScheme.onBackground),
      bodyLarge: const TextStyle().copyWith(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: AppColors.lightColorScheme.onBackground),
      bodyMedium: const TextStyle().copyWith(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
          color: AppColors.lightColorScheme.onBackground),
      bodySmall: const TextStyle().copyWith(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: AppColors.lightColorScheme.onBackground),
      labelLarge: const TextStyle().copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: AppColors.lightColorScheme.onBackground),
      labelMedium: const TextStyle().copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: AppColors.lightColorScheme.onBackground),
      labelSmall: const TextStyle().copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: AppColors.lightColorScheme.onBackground));
}
