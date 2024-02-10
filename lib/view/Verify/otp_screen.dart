import 'package:do_now/authentication/authentication.dart';
import 'package:do_now/view/HomeScreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:get/get.dart';

class OTPScreen extends StatelessWidget {
  final String? verificationId;
  final String email;
  final String username;
  final String phoneNumber;
  final String password;

  const OTPScreen({
    Key? key,
    required this.verificationId,
    required this.email,
    required this.username,
    required this.phoneNumber,
    required this.password,
  }) : super(key: key);

  Future<void> resendOTP(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpController = TextEditingController();
    final AuthenticationService _authService = AuthenticationService();

    Future<void> signInWithOTP(String smsCode, String? verificationId) async {
      try {
        final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId!,
          smsCode: smsCode,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        _authService.registerAndSaveUserData(email, password, username, phoneNumber);
        // User is signed in successfully, show success message and navigate after delay
        Get.snackbar("Verified", "Successfully Verified!");
        // Navigate after a delay
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()), // Replace NextPage with your destination page
          );
        });
      } catch (e) {
        // Handle verification failure
        Get.snackbar("Wrong OTP", "Incorrect Otp, Please Try Again");
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD98754), // Set background color
        title: Text(
          'OTP Verification',
          style: TextStyle(
            color: Colors.white, // Set text color
          ),
        ),
        elevation: 0, // Remove elevation
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter OTP',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 50,
              style: TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                signInWithOTP(pin, verificationId);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Verify OTP
                if (otpController.text.isNotEmpty) {
                  // Check if OTP is not empty
                  signInWithOTP(otpController.text, verificationId);
                } else {
                  // Show error message if OTP is empty
                  Get.snackbar("Empty OTP", "Please enter OTP");
                }
              },
              child: Text('Verify'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                resendOTP(phoneNumber);
              },
              child: Text(
                'Resend OTP',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
