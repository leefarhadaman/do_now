import 'package:do_now/view/HomeScreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:do_now/authentication/authentication.dart';
class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthenticationService _authService = AuthenticationService();
  
  final emailError = RxString('');
  final passwordError = RxString('');

  final showPassword = RxBool(false); // Observable variable for password visibility


  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final user = await _authService.signInWithEmailAndPassword(email, password);
    if (user == null) {
      // Show snackbar for invalid credentials
      Get.snackbar(
        'Error',
        'Invalid username and password',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Success',
        'Successfully Logged In',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.offAll(HomeScreen());
    }
  }

  bool isValidEmail(String email) {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    return emailRegExp.hasMatch(email);
  }

  bool isValidPassword(String password) {
    final passwordRegExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+{}|:"<>?`~]).{8,}$',
    );
    return passwordRegExp.hasMatch(password);
  }

  void validateEmail(String email) {
    if (email.trim().isEmpty) {
      emailError.value = 'Email is required';
    } else if (!isValidEmail(email)) {
      emailError.value = 'Enter a valid email';
    } else {
      emailError.value = '';
    }
  }

  void validatePassword(String password) {
    if (password.trim().isEmpty) {
      passwordError.value = 'Password is required';
    } else if (!isValidPassword(password)) {
      passwordError.value = 'Enter a valid password';
    } else {
      passwordError.value = '';
    }
  }

  void togglePasswordVisibility() {
    showPassword.value = !showPassword.value;
  }


}
