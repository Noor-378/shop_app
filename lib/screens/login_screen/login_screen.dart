import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/login_screen/cubit/login_cubit.dart';
import 'package:shop_app/screens/login_screen/cubit/login_state.dart';
import 'package:shop_app/screens/register_screen/register_screen.dart';
import 'package:shop_app/shared/components/custom_elevated_button.dart';
import 'package:shop_app/shared/components/custom_form_field.dart';
import 'package:shop_app/shared/components/custom_text_button.dart';
import 'package:shop_app/shared/cubit/cubit/cubit.dart';
import 'package:shop_app/shared/styles/colors.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: formKey,
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "LOG",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  "IN",
                                  style: TextStyle(
                                    color: mainColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                  ),
                                )
                              ],
                            ),
                            Image.asset(
                              "assets/images/login.png",
                            ),
                            CustomFormField(
                              keyboardButton: TextInputAction.next,
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
                              label: "Email",
                              icon: Icons.email_outlined,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomFormField(
                              obscureText: LoginCubit.get(context).isObscure,

                              onSubmite: (value) {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              suffixIcon: LoginCubit.get(context).suffix,
                              suffixOnPressed: () {
                                LoginCubit.get(context).changePasswordVisibility();
                              },
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
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              color: state is! LoginLoadingState
                                  ? mainColor
                                  : Colors.grey,
                              child: state is! LoginLoadingState
                                  ? Text(
                                      "LOGIN",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    )
                                  : Lottie.asset(
                                      "assets/animation/loading.json",
                                      fit: BoxFit.cover,
                                      width: 75,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 46),
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
                            onPressed: () {
                              AppCubit.get(context).navigateTo(
                                context,
                                RegisterScreen(),
                              );
                            },
                            text: "register now",
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
            ),
          );
        },
      ),
    );
  }
}
