import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/games_snakcobra_controller.dart';

class GamesSnakcobraView extends GetView<GamesSnakcobraController> {
  const GamesSnakcobraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24.0,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text('GamesSnakcobraView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: _buildGameView()),
          _buildGameControls(),
        ],
      ),
    );
  }

  Widget _buildGameView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: controller.column),
      itemCount: controller.row * controller.column,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: fillBoxColor(index),
          ),
        );
      },
    );
  }

  Widget _buildGameControls() {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Score : ${controller.score}"),
          IconButton(
            onPressed: () {
              if (controller.direction != Direction.down) controller.changeDirection(Direction.up);
            },
            icon: const Icon(Icons.arrow_circle_up, color: Color.fromARGB(255, 10, 235, 126)),
            iconSize: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  if (controller.direction != Direction.right) controller.changeDirection(Direction.left);
                },
                icon: const Icon(Icons.arrow_circle_left_outlined, color: Colors.red),
                iconSize: 100,
              ),
              const SizedBox(width: 100),
              IconButton(
                onPressed: () {
                  if (controller.direction != Direction.left) controller.changeDirection(Direction.right);
                },
                icon: const Icon(Icons.arrow_circle_right_outlined, color: Colors.yellowAccent),
                iconSize: 100,
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              if (controller.direction != Direction.up) controller.changeDirection(Direction.down);
            },
            icon: const Icon(Icons.arrow_circle_down_outlined, color: Colors.white),
            iconSize: 100,
          ),
        ],
      ),
    );
  }

  Color fillBoxColor(int index) {
    if (controller.borderList.contains(index))
      return Colors.yellow;
    else {
      if (controller.snakePosition.contains(index)) {
        if (controller.snakeHead == index) {
          return Colors.green;
        } else {
          return Colors.white.withOpacity(0.9);
        }
      } else {
        if (index == controller.foodPoistion) {
          return Colors.red;
        }
      }
    }
    return Colors.grey.withOpacity(0.05);
  }
}
