import 'package:get/get.dart';

import '../controllers/games_dino_controller.dart';

class GamesDinoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GamesDinoController>(
      () => GamesDinoController(),
    );
  }
}
