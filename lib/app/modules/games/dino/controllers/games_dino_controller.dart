// games_dino_controller.dart
import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';

class GamesDinoController extends GetxController {
  static const double GRAVITY = 1000;
  static const double JUMP_FORCE = -500;
  static const double GAME_SPEED = 300;

  final dinoY = 0.0.obs;
  final obstacleX = <double>[1000].obs;
  final obstacleY = <double>[0].obs;
  final isGameOver = true.obs;
  final score = 0.obs;
  final highScore = 0.obs;
  
  double dinoVelocity = 0;
  bool isJumping = false;
  Timer? gameTimer;

  void startGame() {
    dinoY.value = 0;
    dinoVelocity = 0;
    obstacleX.value = [1000];
    obstacleY.value = [0];
    isGameOver.value = false;
    score.value = 0;
    isJumping = false;

    gameTimer = Timer.periodic(Duration(milliseconds: 16), (timer) {
      updateGame();
    });
  }

  void updateGame() {
    if (isGameOver.value) return;

    // Update dino position
    dinoVelocity += GRAVITY * 0.016;
    dinoY.value += dinoVelocity * 0.016;

    // Ground collision
    if (dinoY.value > 0) {
      dinoY.value = 0;
      dinoVelocity = 0;
      isJumping = false;
    }

    // Update obstacles
    List<double> newObstacleX = List.from(obstacleX);
    for (int i = 0; i < newObstacleX.length; i++) {
      newObstacleX[i] -= GAME_SPEED * 0.016;
    }
    obstacleX.value = newObstacleX;

    // Remove off-screen obstacles
    if (obstacleX[0] < -50) {
      obstacleX.removeAt(0);
      obstacleY.removeAt(0);
      score.value++;
    }

    // Add new obstacles
    if (obstacleX.last < 600) {
      obstacleX.add(1000 + Random().nextDouble() * 300);
      obstacleY.add(0);
    }

    // Check collision
    for (int i = 0; i < obstacleX.length; i++) {
      if (obstacleX[i] < 100 && obstacleX[i] > 20 && dinoY.value > -50) {
        gameOver();
      }
    }
  }

  void jump() {
    if (!isJumping && !isGameOver.value) {
      dinoVelocity = JUMP_FORCE;
      isJumping = true;
    }
  }

  void gameOver() {
    gameTimer?.cancel();
    isGameOver.value = true;
    if (score.value > highScore.value) {
      highScore.value = score.value;
    }
  }

  @override
  void onClose() {
    gameTimer?.cancel();
    super.onClose();
  }
}