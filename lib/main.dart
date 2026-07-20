import 'package:flutter/material.dart';
import 'package:movie_app/common/theme/app_theme.dart';
import 'package:movie_app/screens/onboarding/onboarding_screen.dart';
import 'package:movie_app/screens/onboarding/splash_screen.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.darkTheme,
      home: const SplashScreen(),
    );
  }
}