import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

import '../../../../widgets/loader/loadingDialog.dart'; // Import the QuickAlert package

class LoginController extends GetxController {
  // Text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // No SharedPreferences logic here anymore
  }

  ///////sign in method
  void signUserIn() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      // Show failure alert using QuickAlert
      QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.error,
        title: "Error",
        text: "Please enter both username and password",
        confirmBtnText: "Okay",
      );

      // Dismiss after 3 seconds
      Future.delayed(Duration(seconds: 3), () {
        Get.back(); // This dismisses the alert
      });

      return;
    }

    // Show loader
   Get.dialog(
    LoadingDialog(),
    barrierDismissible: false, // Prevent dismissal by tapping outside
  );

    // Simulate a delay for the login process (e.g., API call)
    await Future.delayed(Duration(seconds: 3));

    // Dismiss the loader after the delay
    Get.back();

    // Navigate to the dashboard or home screen after successful login
    Get.offAllNamed('/home'); // Replace '/home' with your desired route
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
