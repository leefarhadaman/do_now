import 'package:do_now/component/customButton/custom_button.dart';
import 'package:do_now/view/Login/registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:do_now/controller/Login_controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = Get.put(LoginController());

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
                Container(
                  height: MediaQuery.of(context).size.height *
                      0.3, // Set image container height to 30% of screen height
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://imgs.search.brave.com/y0HWyj60zgUlA51mhH9h8VQzeNq-hoXmAu2-O96xC14/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9jZG4u/d2FsbHBhcGVyc2Fm/YXJpLmNvbS8xMS80/NC85WnRpWE8uanBn",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "LOG IN",
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
                    // side: BorderSide(color: Colors.white, width: 2), // Add white border with width 2
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
                          text: 'LOGIN',
                          onPressed: () => _controller.login(),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            // Handle registration navigation here
                            // For now, let's navigate to the registration page
                            Get.off(RegistrationPage());
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.redAccent,
                              fontFamily: 'Comfortaa',
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
