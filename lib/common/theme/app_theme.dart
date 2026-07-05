import 'package:flutter/material.dart';
import 'package:movie_app/common/theme/app_colors.dart';
import 'package:movie_app/common/theme/app_text_style.dart';

class AppThemes {
  static final ThemeData darkTheme = ThemeData(
    colorSchemeSeed: AppColors.yellow,
    scaffoldBackgroundColor: AppColors.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.dark,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyles.style16w400Black.copyWith(
        color: AppColors.yellow,
      ),
    ),
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder: (BuildContext context) =>
          Icon(Icons.arrow_back_sharp, color: AppColors.yellow, size: 21),
    ),
    textTheme: _generateTextTheme(AppColors.dark),
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.yellow),
    ),
  );
  static TextTheme _generateTextTheme(Color color) {
    return TextTheme(
      headlineLarge: AppTextStyles.style36w700Black.copyWith(color: color),
      headlineMedium: AppTextStyles.style36w500Black.copyWith(color: color),
      headlineSmall: AppTextStyles.style36w400Black.copyWith(color: color),
      titleLarge: AppTextStyles.style20w700Black.copyWith(color: color),
      titleMedium: AppTextStyles.style20w600Black.copyWith(color: color),
      titleSmall: AppTextStyles.style20w400Black.copyWith(color: color),
      labelLarge: AppTextStyles.style14w900Black.copyWith(color: color),
      labelMedium: AppTextStyles.style14w600Black.copyWith(color: color),
      labelSmall: AppTextStyles.style14w400Black.copyWith(color: color),
      bodyLarge: AppTextStyles.style16w400Black.copyWith(color: color),
      bodyMedium: AppTextStyles.style15w400Black.copyWith(color: color),
      displayLarge: AppTextStyles.style24w700Black.copyWith(color: color),
    );
  }
}
