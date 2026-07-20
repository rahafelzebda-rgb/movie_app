import 'package:flutter/material.dart';
import 'package:movie_app/common/theme/app_colors.dart';
import 'package:movie_app/common/theme/app_text_style.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
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
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: AppColors.yellow,
            width: 1,
          ),
          backgroundColor: AppColors.dark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.buttomText.copyWith(
            color: AppColors.yellow,
          ),
        ),
      ),
    );
  }
}