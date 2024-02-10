import 'package:do_now/view/HomeScreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:do_now/view/Login/login.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if the user is already authenticated
    User? user = FirebaseAuth.instance.currentUser;

    Future.delayed(Duration(seconds: 3), () {
      if (user != null) {
        // User is already logged in, navigate to HomeScreen
        Get.off(HomeScreen());
      } else {
        // User is not logged in, navigate to LoginPage
        Get.off(LoginPage());
      }
    });

    return Scaffold(
      backgroundColor: Color(0xFFD98754),
      body: Center(
        child: Text(
          "Do Now",
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'PermanentMarker',
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
