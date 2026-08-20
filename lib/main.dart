import 'package:flutter/material.dart';
import 'package:movie_app/common/theme/app_theme.dart';
import 'package:movie_app/screens/login/forget_password_screen.dart';
import 'package:movie_app/screens/login/login_screen.dart';
import 'package:movie_app/screens/login/register_screen.dart'
    hide LoginScreen;
import 'package:movie_app/screens/onboarding/onboarding_screen.dart';
import 'package:movie_app/screens/onboarding/splash_screen.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  Locale currentLocale = const Locale('en');

  void changeLanguage(Locale locale) {
    setState(() {
      currentLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.darkTheme,
      //
      // locale: currentLocale,
      //
      // home: LoginScreen(
      //   onLanguageChanged: changeLanguage,
      //   currentLocale: currentLocale,
      // ),
      home: RegisterScreen(),
    );
  }
}