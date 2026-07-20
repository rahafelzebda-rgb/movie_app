import 'package:flutter/material.dart';

import 'package:movie_app/common/theme/app_colors.dart';
import 'package:movie_app/common/theme/app_text_style.dart';
import 'package:movie_app/screens/onboarding/onbording_data.dart';

class OnbordingItem extends StatelessWidget {
  const OnbordingItem({super.key, required this.data,required this.index});
  final OnbordingData data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
  flex: index == 0 ? 10 : 6,
  child: Stack(
    fit: StackFit.expand,
    children: [
      Image.asset(
        data.image,
        fit: BoxFit.cover,
      ),

      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const[0.0,0.45,0.75,1.0],
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.15),
              Colors.black.withOpacity(0.55),
              AppColors.dark,
            ],
          ),
        ),
        
      ),

      if (index == 0)
  Positioned(
    left: 24,
    right: 24,
    bottom: 150,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          data.title,
          textAlign: TextAlign.center,
          style: AppTextStyles.style24w700White,
        ),
        const SizedBox(height: 16),
        Text(
          data.description,
          textAlign: TextAlign.center,
          style: AppTextStyles.style16w400White,
        ),
      ],
    ),
  ),
    ],
  ),
),
            if(index!=0)
            
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
                decoration: const BoxDecoration(
                  color: AppColors.dark,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      data.title,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.style24w700White
                    ),
                    const SizedBox(height: 16),
                    Text(
                      data.description,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.style16w400White
                    ),

                    const SizedBox(height: 40,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
