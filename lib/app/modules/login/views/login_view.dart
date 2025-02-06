import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/loginpage_components/my_button.dart';
import '../../../../widgets/loginpage_components/my_textfield.dart';
import '../../../../widgets/loginpage_components/square_tile.dart';
import '../../signup/views/signup_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
   final LoginController controller =Get.put(LoginController()); // Corrected name
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
            Text(
              'Welcome Back!',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Log in to your account',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white70,
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
                  // Username TextField
                  MyTextField(
                    controller: controller.usernameController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),

                  // Password TextField
                  MyTextField(
                    controller: controller.passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.poppins(
                        color: Colors.grey[800],
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Login Button
                  MyButton(
                    onTap: controller.signUserIn,
                  ),
                  const SizedBox(height: 30),

                  // Divider with "Or continue with"
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: GoogleFonts.poppins(
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
                  const SizedBox(height: 20),

                  // Google and Apple Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => print("Google Button"),
                        child:
                            SquareTile(imagePath: 'assets/images/google.png'),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      GestureDetector(
                        onTap: () => print("Apple Button"),
                        child: SquareTile(imagePath: 'assets/images/apple.png'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Register Now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: GoogleFonts.poppins(
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () => Get.to(SignupView()),
                        child: Text(
                          'Register now',
                          style: GoogleFonts.poppins(
                            color: const Color.fromRGBO(152, 23, 172, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
