import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/common/gen/assets.gen.dart';
import 'package:movie_app/common/validation/validation_utils.dart';
import 'package:movie_app/common/widgets/primary_buttom.dart';
import 'package:movie_app/common/theme/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/network/auth_servise.dart';
import 'package:movie_app/screens/home/home_screen.dart';
import 'package:movie_app/screens/login/forget_password_screen.dart';
import 'package:movie_app/screens/login/register_screen.dart';
import '../../common/widgets/custom_text_field.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key,
  // required this.onLanguageChanged, required this.currentLocale
   });
  static const String routeName = "/loginScreen";
//  final Function(Locale) onLanguageChanged;
// final Locale currentLocale;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  Center(
                    child: Assets.images.logo.image(height: 118,width:121 ),
                  ),
                  SizedBox(height: 24),
                  CustomTextField(
                    hintText: "Email",
                    prefixIconPath: Assets.icons.email.path,
                    controller: email,
                     validator: (value) {
                      if (ValidationUtils.validateEmptyText(value) == false) {
                         return "empty email";
                       } else if (ValidationUtils.validateEmail(value!) ==
                           false) {
                         return "invalid email";
                       }
                     },
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    hintText: "Password",
                    prefixIconPath: Assets.icons.password.path,
                  isPassword: true,
                    controller: password,
                     validator: (value) {
                       if (value == null || value.isEmpty) {
                         return "empty password";
                       }
                     },
                    
                   ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                        },
                        child: Text(
                          "forget password",
                          style: theme.textTheme. labelSmall!.copyWith(
                            color: AppColors.yellow,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  PrimaryButtom(isLoading: isLoading,
                     onPressed: () async {
                       if (_formkey.currentState!.validate()) {
                         setState(() {
                           isLoading = true;
                         });
                    
                         String? errorMessage = await AuthService.login(
                           email.text,
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
                     },text: 'Login', ),

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
                               decoration: TextDecoration.underline,
                               decorationColor: theme.colorScheme.primary,
                            ),
                             recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.of(
                                 context,
                               ).pushNamed(RegisterScreen.routeName),
                          ),
                        ],
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "OR",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: AppColors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  PrimaryButtom(
                    onPressed: () {},
                     text: '',
                    child:
                    Row(
                      spacing: 16,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                          Assets.images.google.image(
                          width: 24,
                          height: 24,),
                        Text(
                          "Login with google",
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: AppColors.dark,

                          ),
                        ),
                      ],
                    ),
                 ),],),
          )),
            ),
          ),
        );
    
  }
}
