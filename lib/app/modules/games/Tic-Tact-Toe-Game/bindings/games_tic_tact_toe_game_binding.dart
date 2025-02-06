import 'package:get/get.dart';

import '../controllers/games_tic_tact_toe_game_controller.dart';

class GamesTicTactToeGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GamesTicTactToeGameController>(
      () => GamesTicTactToeGameController(),
    );
  }
}
