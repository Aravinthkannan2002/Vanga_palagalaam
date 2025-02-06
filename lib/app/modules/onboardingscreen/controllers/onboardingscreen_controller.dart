import 'package:get/get.dart';

class OnboardingscreenController extends GetxController {
      var currentPage = 0.obs; // Observable to track the current page
  //TODO: Implement OnboardingscreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

   void skipToHome() {
    Get.offNamed('/login'); // Replace with your desired route
  }

  void increment() => count.value++;
}
