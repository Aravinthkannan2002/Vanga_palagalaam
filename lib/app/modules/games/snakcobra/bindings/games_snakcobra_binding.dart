import 'package:get/get.dart';

import '../controllers/games_snakcobra_controller.dart';

class GamesSnakcobraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GamesSnakcobraController>(
      () => GamesSnakcobraController(),
    );
  }
}
