import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/custom_text_field.dart';
import 'package:movie_app/screens/login/forget_password_screen.dart';
import '../../common/gen/assets.gen.dart';
import '../../common/widgets/primary_buttom.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});
  static const String routeName="/forgetPasswordScreen";

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    bool isLoading = false;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back
        )),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Assets.images.forgotPassword.image(width: 260, height: 260),
            SizedBox(height: 16),
            CustomTextField(
              hintText: "Email",
              prefixIconPath: Assets.icons.email.path,
              controller: email,
            ),
            SizedBox(height: 16),
            PrimaryButtom(text: 'Verify Email', onPressed: () {
             
            }),
          ],
        ),
      ),
    );
  }
}
