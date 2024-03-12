import 'package:authentication/view/bottom_bar/bottom_bar.dart';
import 'package:authentication/view/login_page/selectlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: currentUser != null ? const Bottom() : const SelectLoginTypePage(),
    );
  }
}
