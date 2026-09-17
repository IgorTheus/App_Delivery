import 'package:appaula04/ui/_core/app_colors.dart';
import 'package:flutter/material.dart';

// cria uma classe abstrata do tema do app

abstract class AppTheme {
  // Cria uma variavel para armazenar o tema do app
  // Função para copiar o tema do aplicativo

  static ThemeData appTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    colorScheme: ColorScheme.light(
      primary: AppColors.mainColor,
      secondary: AppColors.mainColorLight,
      surface: AppColors.surfaceColor,
      error: AppColors.errorColor,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimary),
      bodyMedium: TextStyle(color: AppColors.textPrimary),
      bodySmall: TextStyle(color: AppColors.textSecondary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        )),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 16),
        ),
        foregroundColor: const WidgetStatePropertyAll(AppColors.onMainColor),
        backgroundColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.borderColor;
          } else if (states.contains(WidgetState.pressed)) {
            return AppColors.mainColorPressed;
          }
          return AppColors.mainColor;
        }),
      ),
    ),
  );
}