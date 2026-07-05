import 'package:flutter/material.dart';
import 'package:movie_app/common/theme/app_colors.dart';
import 'package:movie_app/common/theme/app_text_style.dart';

class PrimaryButtom extends StatelessWidget {
  const PrimaryButtom({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 56,
  });
  final String text;
  final VoidCallback onPressed;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.yellow,
          foregroundColor: AppColors.dark,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.buttomText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
