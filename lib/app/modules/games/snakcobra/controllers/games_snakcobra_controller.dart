import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Direction { up, down, left, right }

class GamesSnakcobraController extends GetxController {
  final int row = 20, column = 20;
  final RxList<int> borderList = <int>[].obs;
  final RxList<int> snakePosition = <int>[].obs;
  int snakeHead = 0;
  int score = 11;
  Direction direction = Direction.right;
  late int foodPoistion;

  @override
  void onInit() {
    super.onInit();
    startGame();
  }

  void startGame() {
    makeBorder();
    generateFood();
    snakePosition.addAll([45, 44, 43]);
    snakeHead = snakePosition.first;

    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      updateSnake();
      if (checkCollision()) {
        timer.cancel();
        showGameOverDialog();
      }
    });
  }

  void showGameOverDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text("Game Over"),
        content: const Text("Your snake collided!"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              startGame();
            },
            child: const Text("Restart"),
          ),
        ],
      ),
    );
  }

  bool checkCollision() {
    if (borderList.contains(snakeHead)) return true;
    if (snakePosition.sublist(1).contains(snakeHead)) return true;
    return false;
  }

  void generateFood() {
    foodPoistion = Random().nextInt(row * column);
    if (borderList.contains(foodPoistion)) {
      generateFood();
    }
  }

  void updateSnake() {
    switch (direction) {
      case Direction.up:
        snakePosition.insert(0, snakeHead - column);
        break;
      case Direction.down:
        snakePosition.insert(0, snakeHead + column);
        break;
      case Direction.right:
        snakePosition.insert(0, snakeHead + 1);
        break;
      case Direction.left:
        snakePosition.insert(0, snakeHead - 1);
        break;
    }

    if (snakeHead == foodPoistion) {
      score++;
      generateFood();
    } else {
      snakePosition.removeLast();
    }

    snakeHead = snakePosition.first;
    update();
  }

  void changeDirection(Direction newDirection) {
    direction = newDirection;
    update();
  }

  void makeBorder() {
    for (int i = 0; i < column; i++) borderList.add(i);
    for (int i = 0; i < row * column; i = i + column) borderList.add(i);
    for (int i = column - 1; i < row * column; i = i + column) borderList.add(i);
    for (int i = (row * column) - column; i < row * column; i++) borderList.add(i);
  }
}
