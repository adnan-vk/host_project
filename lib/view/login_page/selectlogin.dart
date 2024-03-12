import 'package:authentication/view/admin/admin_login_page.dart';
import 'package:authentication/view/login_page/login.dart';
import 'package:authentication/view/welcome_page/welcome_page.dart';
import 'package:flutter/material.dart';

class SelectLoginTypePage extends StatelessWidget {
  const SelectLoginTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Login Type',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                label: const Text(
                  'User Login',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(appcolor.orange),
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))))),
            const SizedBox(height: 20),
            OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminLoginPage(),
                      ));
                },
                icon: const Icon(
                  Icons.person_outline,
                  size: 30,
                ),
                label: const Text(
                  'Admin Login',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(appcolor.orange),
                    side: MaterialStatePropertyAll(
                        BorderSide(color: appcolor.orange)),
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))))),
          ],
        ),
      ),
    );
  }
}
