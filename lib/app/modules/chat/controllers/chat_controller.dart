// ChatController with 3-second delay
import 'package:get/get.dart';

class ChatController extends GetxController {
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Simulate 3-second delay
    Future.delayed(const Duration(seconds: 3), () {
      isLoading.value = false;
    });
  }
}

// Sample data
final chatData = [
  {'title': 'Mom', 'subtitle': 'hii.. 😊', 'image': 'assets/images/mom.jpg'},
  {'title': 'Sista', 'subtitle': 'where are you 🤔?', 'image': 'assets/images/sista.jpg'},
  {'title': 'Saji', 'subtitle': 'Leyyy... 😂', 'image': 'assets/images/shaji.jpg'},
  {'title': 'Hr Mam', 'subtitle': 'Snd me your details 📑', 'image': 'assets/images/hr mma.jpg'},
  {'title': 'Sathish', 'subtitle': 'hi daaa 😎', 'image': 'assets/images/sathish.jpg'},
  {'title': 'Aravind', 'subtitle': 'heyyy 😄', 'image': 'assets/images/arvaind.jpg'},
  {'title': 'Muthuvel', 'subtitle': 'gooood 👍', 'image': 'assets/images/schoolfrd.jpg'},
  {'title': 'schl frnd', 'subtitle': 'are you finished your work? ⏰', 'image': 'assets/images/schoolfrd.jpg'},
];