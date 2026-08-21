import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIconPath,
    this.isPassword = false, this.maxLines, this.controller, this.validator,
  });
  final String hintText;
  final String prefixIconPath;
  final bool isPassword;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isSvg(String path) => widget.prefixIconPath.contains(".svg");
  late bool isObscured = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
    //     if (widget.titleText != null)
    // Text(widget.titleText ?? '', style: theme.textTheme.titleMedium),
          TextFormField
      (
      controller: widget.controller,
      style:TextStyle(
        color: AppColors.white,
      ),
      obscureText: isObscured,
      enableSuggestions: !widget.isPassword,
      autocorrect: !widget.isPassword,
      validator: widget.validator,
      onTapUpOutside: (event) => FocusScope.of(context).unfocus(),
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: AppColors.stroke,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 16, bottom: 12, top: 12, right: 8),
          child: _isSvg(widget.prefixIconPath)
              ? SvgPicture.asset(widget.prefixIconPath)
              : Image.asset(widget.prefixIconPath),
        ),
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    isObscured = !isObscured;
                  });
                },
                child: Icon(
                  isObscured?Icons.visibility_off:
                  Icons.remove_red_eye_outlined,
                  color: AppColors.white,
                ),
              )
            : null,
        hintStyle: theme.textTheme.bodyLarge!.copyWith(color: AppColors.white),

        border: _generateBorderStyle(),
        enabledBorder: _generateBorderStyle(),
        focusedBorder: _generateBorderStyle(),
      ),
          ),
    ]
    );
  }

  _generateBorderStyle() => OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.stroke),
    borderRadius: BorderRadius.circular(16),
  );
}