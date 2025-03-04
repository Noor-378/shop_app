import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/custom_elevated_button.dart';
import 'package:shop_app/shared/components/custom_form_field.dart';
import 'package:shop_app/shared/components/custom_text_button.dart';
import 'package:shop_app/shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Log",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              "In",
              style: TextStyle(
                color: mainColor,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/login2.png",
                  ),
                  CustomFormField(
                    hint: "Enter You'r Email",
                    type: TextInputType.text,
                    controller: emailController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "please enter your email address";
                      } else {
                        return null;
                      }
                    },
                    label: "Password",
                    icon: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    suffixIcon: Icons.visibility_outlined,
                    suffixOnPressed: () {},
                    hint: "Enter You'r Password",
                    type: TextInputType.visiblePassword,
                    controller: passwordController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "password is too short";
                      } else {
                        return null;
                      }
                    },
                    label: "Password",
                    icon: Icons.lock_outline,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomElevatedButton(
                    height: 45,
                    onPressed: () {},
                    text: "LOGIN",
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: 75,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  CustomTextButton(
                    onPressed: () {},
                    text: "Sing up",
                    isBlue: false,
                    notBlueColor: Colors.white,
                    underline: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
