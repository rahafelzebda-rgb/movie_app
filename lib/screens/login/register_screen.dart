import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/common/gen/assets.gen.dart';
import 'package:movie_app/common/models/custom_user_model.dart';
import 'package:movie_app/common/widgets/primary_buttom.dart';
import 'package:movie_app/common/theme/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/network/auth_servise.dart';
import 'package:movie_app/screens/home/home_screen.dart';
import 'package:movie_app/screens/login/login_screen.dart';
import 'package:movie_app/screens/login/register_screen.dart';
import '../../common/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = "/regiserScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController reEnterPassword = TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Form(
              key: _globalKey,
              child: ListView(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.images.photoGamer1.image(height: 94, width: 85),
                        const SizedBox(width: 10),
                        Assets.images.photoGamer2.image(
                          height: 158,
                          width: 151,
                        ),
                        const SizedBox(width: 10),
                        Assets.images.photoGamer3.image(height: 94, width: 85),
                      ],
                    ),
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
                    controller: name,
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
                    controller: reEnterPassword,
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    hintText: "Phone Number",
                    prefixIconPath: Assets.icons.email.path,
                  ),
                  SizedBox(height: 15),
                  PrimaryButtom(
                    text: 'Create Account',
                    isLoading: isLoading,
                    onPressed: () async {
                      if (_globalKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });

                        String? errorMessage = await AuthService.register(
                          CustomUserModel(name: name.text, email: email.text),
                          password.text,
                        );

                        //print("done");
                        setState(() {
                          isLoading = false;
                        });
                        if (errorMessage != null) {
                          //toast
                          Fluttertoast.showToast(
                            msg: errorMessage,
                            backgroundColor: AppColors.red,
                            toastLength: Toast.LENGTH_LONG,
                          );
                        } else {
                          if (context.mounted) {
                            Navigator.pushReplacementNamed(
                              context,
                              HomeScreen.routeName,
                            );
                          }
                        }
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "Already Have Account?"),
                          TextSpan(
                            text: "Login",
                            style: theme.textTheme.labelSmall!.copyWith(
                              color: AppColors.yellow,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                  context,
                                 LoginScreen.routeName,
                                );
                              },
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
