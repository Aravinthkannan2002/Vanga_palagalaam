import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/loginpage_components/square_tile.dart';
import '../../../../widgets/signuppage_components/signup_button.dart';
import '../../../../widgets/signuppage_components/signup_textfield.dart';
import '../../login/views/login_view.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final SignupController controller =Get.put(SignupController()); // Corrected name
  SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:Colors.purple,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.1),

            // Logo Section
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                Icons.lock,
                size: 50,
                color: const Color.fromRGBO(152, 23, 172, 1),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Welcome Text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Let\'s create an Account For You!',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),

            // Login Form Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(75),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Signup Form Section
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // username textfield
                        signup_textfield(
                          controller: controller.signupusernameController,
                          hintText: 'Email',
                          obscureText: false,
                        ),

                        const SizedBox(height: 10),

                        // password textfield
                        signup_textfield(
                          controller: controller.signuppasswordController,
                          hintText: 'Password',
                          obscureText: true,
                        ),
                        const SizedBox(height: 10),

                        // confirm password
                        signup_textfield(
                          controller: controller.confirmpasswordController,
                          hintText: 'Confirm Password',
                          obscureText: true,
                        ),

                        const SizedBox(height: 25),

                        // sign up button
                        SignupButton(
                          onTap: controller.signUserIn,
                        ),

                        const SizedBox(height: 50),

                        // or continue with
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'Or continue with',
                                  style: GoogleFonts.acme(
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 50),

                        // google + apple sign in buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // google button
                            GestureDetector(
                              child: SquareTile(
                                  imagePath: 'assets/images/google.png'),
                              onTap: () {
                                print("Google Button");
                              },
                            ),

                            SizedBox(
                                width: screenWidth *
                                    0.05), // Adjust spacing based on screen width

                            // apple button
                            GestureDetector(
                              child: SquareTile(
                                  imagePath: 'assets/images/apple.png'),
                              onTap: () {
                                print("Apple Button");
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // not a member? register now
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an Account?',
                              style: GoogleFonts.acme(
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              child: Text(
                                'Login Now',
                                style: GoogleFonts.acme(
                                  color:
                                      const Color.fromRGBO(152, 23, 172, 0.6),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {
                                Get.to(LoginView());
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
