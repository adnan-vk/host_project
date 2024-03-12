import 'package:flutter/material.dart';

class SnackBarWidget {
  void showSuccessSnackbar(BuildContext context, String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void showErrorSnackbar(BuildContext context, String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
