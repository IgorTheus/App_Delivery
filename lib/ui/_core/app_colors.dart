// Arquivo para estilizar as cores do aplicativo

import 'package:flutter/material.dart'; // biblioteca para os widgets do flutter

// classe abstrata
abstract class AppColors {
  // Base
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color surfaceColor = Color(0xFFF6F8F7);
  static const Color fundoCards = Color(0xFFFFFFFF);

  // Marca
  static const Color mainColor = Color(0xFF12B76A);
  static const Color mainColorPressed = Color(0xFF0E9355);
  static const Color mainColorLight = Color(0xFFE8F8EF);

  // Texto
  static const Color textPrimary = Color(0xFF131A17);
  static const Color textSecondary = Color(0xFF6E7A74);
  static const Color onMainColor = Color(0xFFFFFFFF);

  // Estrutura
  static const Color borderColor = Color(0xFFE9ECEA);

  // Feedback
  static const Color warningColor = Color(0xFFF79009);
  static const Color errorColor = Color(0xFFF04438);
}