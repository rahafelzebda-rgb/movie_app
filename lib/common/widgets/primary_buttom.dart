// import 'package:flutter/material.dart';
// import 'package:movie_app/common/theme/app_colors.dart';
// import 'package:movie_app/common/theme/app_text_style.dart';
//
// class PrimaryButtom extends StatelessWidget {
//   const PrimaryButtom({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     this.height = 50, this.child,
//   });
//   final Widget? child;
//   final String text;
//   final VoidCallback onPressed;
//   final double height;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: height,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.yellow,
//           foregroundColor: AppColors.dark,
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//         ),
//         child: child ??
//         // Text(
//         // text,
//         //         style: Theme.of(context).textTheme.titleMedium!
//         //             .copyWith(
//         //           fontWeight: FontWeight.w600,
//         //           color: Colors.black,
//         //         ),
//         //       ),
//         Text(
//           text,
//           style: AppTextStyles.buttomText,
//           textAlign: TextAlign.center,
//
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:movie_app/common/theme/app_colors.dart';
class PrimaryButtom extends StatelessWidget {
  const PrimaryButtom({
    super.key,
    this.onPressed,
    required this.text,
    this.isLoading = false,this.child,
  });
  final Widget? child;
  final void Function()? onPressed;
  final String text;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        isLoading
            ? Center(child: CircularProgressIndicator())
            : Expanded(
          child: SizedBox(
            height: 46,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: onPressed,
              child: child ??
              Text(
                text,
                style: Theme.of(context).textTheme.titleMedium!
                    .copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.dark,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}