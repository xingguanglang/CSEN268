// lib/theme/design_system.dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF6C5CE7);
  static const Color background = Color(0xFFF8F8FA);
  static const Color textPrimary = Color(0xFF1C1B1F);
  static const Color subtitle = Color(0xFF6B7280);
  static const Color grayLight = Color(0xFFD9D9D9);
  static const Color accentBg = Color(0xFFFEF7FF);
}

class AppDim {
  static const double pagePadding = 16.0;
  static const double cardRadius = 8.0;
  static const double smallGap = 8.0;
  static const double mediumGap = 16.0;
}

class AppText {
  static const TextStyle appBarTitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle title = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    color: AppColors.subtitle,
  );

  static const TextStyle body = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    color: AppColors.subtitle,
  );
}
