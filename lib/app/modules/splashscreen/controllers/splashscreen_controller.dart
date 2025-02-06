import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SplashscreenController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Start the splash screen logic (delay and navigation)
    _navigateToHome();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Increment counter logic
  void increment() => count.value++;

  // Navigate to home screen after a delay
  void _navigateToHome() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed('/onboardingscreen'); // Replace with the actual route name of your home screen
    });
    update();
  }
}
