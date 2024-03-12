import 'package:authentication/service/authentication/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final AuthService authService = AuthService();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  Future<UserCredential> signUpEmail(String email, String password) async {
    return await authService.signUpEmail(email, password);
  }

  Future<UserCredential> signInEmail(String email, String password) async {
    return await authService.signInEmail(email, password);
  }

  Future<void> signOutEmail() async {
    return await authService.signOutEmail();
  }

  Future<void> googleSignIn() async {
    await authService.googleSignIn();
    notifyListeners();
  }

  Future<void> googleSignout() async {
    await authService.googleSignOut();
    notifyListeners();
  }

  gitHubSignIn(BuildContext context) async {
    try {
      await authService.gitHubSign(context);
    } catch (e) {
      throw Exception('Exception $e');
    }
    notifyListeners();
  }

  clearControllers() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    phoneController.clear();
    otpController.clear();
    notifyListeners();
  }

  Future<void> getOtp(phoneNumber) async {
    await authService.getOtp(phoneNumber);
    notifyListeners();
  }

  Future<void> verifyOtp(otp,context) async {
    await authService.verifyOtp(otp,context);
    notifyListeners();
  }
}
