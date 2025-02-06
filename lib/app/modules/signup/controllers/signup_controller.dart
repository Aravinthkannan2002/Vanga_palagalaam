import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';

class SignupController extends GetxController {
  final signupusernameController = TextEditingController();
  final signuppasswordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    update();
  }

  ///////sign in method
  void signUserIn() {
    final username = signupusernameController.text.trim();
    final password = signuppasswordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.error,
        title: "Error",
        text: "Please enter both username and password",
        confirmBtnText: "OK",
        onConfirmBtnTap: () {
          Get.back(); // Close the alert
        },
      );
      return;
    }

    // Show success QuickAlert
    QuickAlert.show(
      context: Get.context!,
      type: QuickAlertType.success,
      title: "Success",
      text: "Logged in as $username",
      confirmBtnText: "OK",
      onConfirmBtnTap: () {
        Get.offAllNamed('/dashboard'); // Navigate to the desired route
      },
    );
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
