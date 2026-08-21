import 'package:movie_app/common/gen/assets.gen.dart';
import 'package:movie_app/common/widgets/primary_buttom.dart';
import 'package:movie_app/common/theme/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/login/register_screen.dart';
import '../../common/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = "/loginScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Form(
              key: _formkey,
              child: ListView(
                children: [
                  Row(
                    children: [
                      Assets.images.photoGamer1.image(height: 94, width: 94),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          Assets.images.photoGamer2.image(
                            height: 158,
                            width: 161,
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(8)),
                      Assets.images.photoGamer3.image(height: 94, width: 94),
                    ],
                  ),
                  Text(
                    "Avatar",
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 24),
                  CustomTextField(
                    hintText: "Name",
                    prefixIconPath: Assets.icons.name.path,
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    hintText: "Email",
                    prefixIconPath: Assets.icons.email.path,
                    controller: email,
                  ),

                  SizedBox(height: 15),
                  CustomTextField(
                    hintText: "Password",
                    prefixIconPath: Assets.icons.password.path,
                    isPassword: true,
                    controller: password,
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    hintText: " Confirm Password",
                    prefixIconPath: Assets.icons.password.path,
                    isPassword: true,
                    controller: password,
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    hintText: "Phone Number",
                    prefixIconPath: Assets.icons.email.path,
                  ),
                  SizedBox(height: 15),
                  PrimaryButtom(text: 'Create Account', onPressed: () {}),
                  SizedBox(height: 20),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "Don't Have Account ? "),
                          TextSpan(
                            text: "Create One",
                            style: theme.textTheme.labelSmall!.copyWith(
                              color: AppColors.yellow,
                            ),
                          ),
                        ],
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
