// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously

import 'package:authentication/controller/authenticarion_provider/auth_provider.dart';
import 'package:authentication/view/bottom_bar/bottom_bar.dart';
import 'package:authentication/view/login_page/widgets/login_widgets.dart';
import 'package:authentication/view/signup_page/signup.dart';
import 'package:authentication/view/welcome_page/welcome_page.dart';
import 'package:authentication/widgets/divider.dart';
import 'package:authentication/widgets/snackbar_widget.dart';
import 'package:authentication/widgets/text_filed_widget.dart';
import 'package:authentication/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key});
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pro = Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * .2,
                ),
                Material(
                  elevation: 5,
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.only(top: 50, left: 10, right: 10),
                    width: double.infinity,
                    height: size.height * .7,
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: TextWidget().text(data: "WELCOME BACK")),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: TextWidget().text(
                                data: "Log In",
                                color: appcolor.orange,
                                weight: FontWeight.bold,
                                size: 30.0)),
                        const SizedBox(
                          height: 15,
                        ),
                        textFormField().textformfield(
                            controller: pro.emailController,
                            labeltext: "Enter Your Email"),
                        const SizedBox(
                          height: 20,
                        ),
                        textFormField().textformfield(
                            controller: pro.passwordController,
                            labeltext: "Enter Your Password"),
                        const SizedBox(
                          height: 20,
                        ),
                        FloatingActionButton.extended(
                          label: TextWidget().text(data: "LOGIN"),
                          backgroundColor: appcolor.orange,
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              try {
                                await pro.signInEmail(pro.emailController.text,
                                    pro.passwordController.text);
                                SnackBarWidget().showSuccessSnackbar(
                                    context, 'user logged in');
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Bottom(),
                                  ),
                                  (route) => false,
                                );
                                pro.emailController.clear();
                                pro.passwordController.clear();
                              } catch (e) {
                                SnackBarWidget().showErrorSnackbar(
                                    context, 'Email or password incorrect');
                              }
                            }
                            return;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        divider().lineDivider(text: "or"),
                        LoginPageWidget().loginIcons(context),
                        Row(
                          children: [
                            TextWidget().text(data: "Don't Have an Account ? "),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SigninScreen(),
                                    ),
                                  );
                                },
                                child: TextWidget().text(
                                    data: "SIGNUP", color: appcolor.orange)),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
