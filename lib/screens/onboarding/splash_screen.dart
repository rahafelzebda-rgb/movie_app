import 'package:flutter/material.dart';
import 'package:movie_app/common/gen/assets.gen.dart';
import 'package:movie_app/common/theme/app_colors.dart';
import 'package:movie_app/screens/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2),(){
      if(!mounted)return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const OnboardingScreen(),),);
    });
  }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.stroke,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Assets.images.logo.image(width: 253, height: 253),
                ),
              ),
              Padding(padding: const EdgeInsets.only(bottom: 24),
              child: Assets.images.route.image(width: 170),)
            ],
          ),
        ),
      ),
    );
  }
}
