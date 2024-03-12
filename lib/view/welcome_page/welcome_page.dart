// ignore_for_file: use_key_in_widget_constructors

import 'package:authentication/authentication/authhentication.dart';
import 'package:authentication/theme/app_color.dart';
import 'package:authentication/widgets/text_widget.dart';
import 'package:flutter/material.dart';

AppColors appcolor = AppColors();

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 198, 10),
              Color.fromARGB(255, 253, 177, 63),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget().text(
                  data: 'Discover a World of',
                  color: Colors.white,
                  size: 32.0,
                  weight: FontWeight.bold,
                ),
                TextWidget().text(
                  data: 'Books',
                  color: Colors.white,
                  size: 32.0,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 20),
                TextWidget().text(
                  data:
                      'Explore, Read, and Immerse Yourself in Endless Stories',
                  color: Colors.white,
                  size: 18.0,
                  align: TextAlign.center,
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: size.width * 0.6,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: appcolor.yellow,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthPage(),
                        ),
                      );
                    },
                    child: TextWidget().text(
                      data: 'Get Started',
                      color: appcolor.orange,
                      size: 18.0,
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
