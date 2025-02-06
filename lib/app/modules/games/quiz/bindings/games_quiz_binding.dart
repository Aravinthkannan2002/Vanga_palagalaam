import 'package:get/get.dart';

import '../controllers/games_quiz_controller.dart';

class GamesQuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GamesQuizController>(
      () => GamesQuizController(),
    );
  }
}
