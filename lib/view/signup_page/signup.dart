import 'package:authentication/controller/authenticarion_provider/auth_provider.dart';
import 'package:authentication/view/home_page/home_page.dart';
import 'package:authentication/view/welcome_page/welcome_page.dart';
import 'package:authentication/widgets/snackbar_widget.dart';
import 'package:authentication/widgets/text_filed_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({Key? key}) : super(key: key);

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
                    padding:
                        const EdgeInsets.only(top: 55, left: 20, right: 20),
                    width: double.infinity,
                    height: size.height * .6,
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("WELCOME"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: textwidget.text(
                                data: "Sign up",
                                color: appcolor.orange,
                                weight: FontWeight.bold,
                                size: 30.0)),
                        const SizedBox(
                          height: 15,
                        ),
                        textFormField().textformfield(
                          controller: pro.usernameController,
                          labeltext: "Enter Your Username",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        textFormField().textformfield(
                          controller: pro.passwordController,
                          labeltext: "Enter Your Password",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        textFormField().textformfield(
                          controller: pro.emailController,
                          labeltext: "Enter Your Email",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FloatingActionButton.extended(
                            label: const Text("SIGNUP"),
                            backgroundColor: Colors.orange,
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                try {
                                  pro.signUpEmail(pro.emailController.text,
                                      pro.passwordController.text);
                                  Navigator.pop(context);
                                  SnackBarWidget().showSuccessSnackbar(
                                      context, 'Account has been created');
                                  pro.clearControllers();
                                } catch (e) {
                                  SnackBarWidget().showErrorSnackbar(context,
                                      'Account not created, try again');
                                }
                              }
                            }),
                        Row(
                          children: [
                            const Text("Back to Login.."),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: textwidget.text(
                                data: "LOGIN",
                                color: appcolor.orange,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
