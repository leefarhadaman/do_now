import 'package:do_now/view/Verify/OTPService/otp_service.dart';
import 'package:do_now/view/Verify/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final RxString usernameError = RxString('');
  final emailError = RxString('');
  final passwordError = RxString('');
  final phoneNumberError = RxString('');

  final showPassword = RxBool(false); // Observable variable for password visibility
  final RxBool isLoading = false.obs;

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

  void validateUsername(String value) {
    if (value.isEmpty) {
      usernameError.value = 'Username is required';
    } else {
      usernameError.value = '';
    }
  }
  void validatePhoneNumber(String phoneNumber) {
    // Trim the phone number
    phoneNumber = phoneNumber.trim();

    // Check if the phone number is empty
    if (phoneNumber.isEmpty) {
      phoneNumberError.value = 'Phone number is required';
      return;
    }

    // Check if the phone number contains only digits
    if (!phoneNumber.contains(RegExp(r'^[0-9]+$'))) {
      phoneNumberError.value = 'Invalid characters in phone number';
      return;
    }

    // Remove any existing non-digit characters from the phone number
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Check if the phone number length is less than 10
    if (phoneNumber.length < 10) {
      phoneNumberError.value = 'Phone number must be 10 digits long';
      return;
    }

    // Check if the phone number starts with the default country code (+91)
    if (!phoneNumber.startsWith('91')) {
      // If not, prepend the default country code (+91)
      phoneNumber = '91$phoneNumber';
    }

    // Check if the phone number is valid
    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(phoneNumber)) {
      phoneNumberError.value = 'Invalid phone number format';
      return;
    }

    // Phone number is valid, clear any previous error messages
    phoneNumberError.value = '';
  }



  Future<void> sendOTP({
    required String email,
    required String username,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      print("Called!");
      isLoading.value = true; // Set loading state to true
      await OTPService.sendOTP(
        phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          // Handle verification completed
          isLoading.value = false; // Set loading state to false
          // Navigate to OTP verification screen (Optional: if verification is completed automatically)
          Get.to(
                () => OTPScreen(
              email: email,
              username: username,
              phoneNumber: phoneNumber,
              password: password,
              verificationId: '',
            ),
          ); // Pass user data to OTPScreen
        },
        verificationFailed: (FirebaseAuthException authException) {
          // Handle verification failed
          isLoading.value = false; // Set loading state to false
          // Display error message to the user
          // (You can use Get.snackbar() or show a dialog to display the error message)
        },
        codeSent: (String verificationId, [int? forceResendingToken]) async {
          // Handle code sent
          isLoading.value = false; // Set loading state to false
          // Navigate to OTP verification screen and pass verificationId
          Get.to(
                () => OTPScreen(
              verificationId: verificationId,
              email: email,
              username: username,
              phoneNumber: phoneNumber,
              password: password,
            ),
          ); // Pass user data and verificationId to OTPScreen
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle timeout for OTP auto retrieval
          isLoading.value = false; // Set loading state to false
          // Display error message to the user (optional)
        },
      );
    } catch (e) {
      // Handle error
      isLoading.value = false; // Set loading state to false
      // Display error message to the user
      // (You can use Get.snackbar() or show a dialog to display the error message)
    }
  }


}
