import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:do_now/component/customButton/custom_button.dart';
import 'package:do_now/controller/Registration_Controller/registration_controller.dart';
import 'package:do_now/view/Verify/otp_screen.dart';
import 'package:do_now/view/Login/login.dart';

class RegistrationPage extends StatelessWidget {
  final RegistrationController _controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontFamily: 'PermanentMarker',
                        fontSize: 30,
                        letterSpacing: 5,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 0, // Set elevation to 0 to make transparent
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    // side: BorderSide(color: Colors., width: 2), // Add white border with width 2
                  ),
                  color: Color(0XFFFCF5EF), // Make the card transparent
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Obx(() {
                          return TextField(
                            controller: _controller.emailController,
                            onChanged: _controller.validateEmail,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              errorText: _controller.emailError.value,
                              prefixIcon: Icon(Icons.mail),
                              border: OutlineInputBorder(),
                            ),
                          );
                        }),
                        SizedBox(height: 20),
                        Obx(() {
                          return TextField(
                            controller: _controller.usernameController,
                            onChanged: _controller.validateUsername,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              errorText: _controller.usernameError.value,
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                            ),
                          );
                        }),
                        SizedBox(height:20),
                        Obx(() {
                          return TextField(
                            controller: _controller.phoneNumberController,
                            onChanged: _controller.validatePhoneNumber,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              errorText: _controller.phoneNumberError.value,
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(),
                            ),
                          );
                        }),
                        SizedBox(height:20),
                        Obx(() {
                          return TextField(
                            controller: _controller.passwordController,
                            onChanged: _controller.validatePassword,
                            obscureText: !_controller.showPassword.value,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              errorText: _controller.passwordError.value,
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _controller.togglePasswordVisibility();
                                },
                                child: Icon(
                                  _controller.showPassword.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          );
                        }),
                        SizedBox(height: 20),
                        CustomButton(
                          text: 'Register',
                          onPressed: () {
                            // Pass user data to sendOTP
                            _controller.sendOTP(
                              email: _controller.emailController.text.trim(),
                              username: _controller.usernameController.text.trim(),
                              phoneNumber: _controller.phoneNumberController.text.trim(),
                              password: _controller.passwordController.text.trim(),
                            );
                          },
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Get.off(LoginPage());
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 15,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ],
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
