import 'package:alison_test/application/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData getTheme() {
    return _lightTheme;
  }

  static ThemeData get _lightTheme => ThemeData(
    colorSchemeSeed: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: const TextTheme(
      bodyMedium: baseTestStyle,
      headlineSmall: baseHeadingStyle,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    ),
  );
}

const baseTestStyle = TextStyle(fontFamily: 'Lufga');
const baseHeadingStyle = TextStyle(fontFamily: 'Lufga');
