// ignore_for_file: must_be_immutable

import 'package:authentication/view/admin/add_data.dart';
import 'package:authentication/widgets/text_filed_widget.dart';
import 'package:flutter/material.dart';

class AdminLoginPage extends StatelessWidget {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  AdminLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textFormField().textformfield(
                controller: usernamecontroller, labeltext: "Username"),
            const SizedBox(height: 20),
            textFormField().textformfield(
                controller: passwordcontroller,
                labeltext: "Password",
                obsc: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                adminlogin(context);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  adminlogin(context) {
    if (usernamecontroller.text == "user" && passwordcontroller.text == "123") {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddBookPage(),
          ));
    }
  }
}
