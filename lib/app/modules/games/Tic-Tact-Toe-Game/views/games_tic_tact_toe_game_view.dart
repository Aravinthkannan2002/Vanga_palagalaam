import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/games_tic_tact_toe_game_controller.dart';

class GamesTicTactToeGameView extends StatelessWidget {
  final GamesTicTactToeGameController controller =
      Get.put(GamesTicTactToeGameController());

  GamesTicTactToeGameView({super.key});

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAllNamed('/games'); // Navigate to the home screen
          },
        ),
        title:  Text('Tic Tac Toe', style: GoogleFonts.acme(
                  // fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),),
        centerTitle: true,
      ),
      body: Obx(() {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "It's ${controller.lastValue.value}'s turn".toUpperCase(),
                style: GoogleFonts.acme(
                  fontSize: 28, // Use your desired font size
                  fontWeight: FontWeight.bold, // Use your desired font weight
                  color: controller.lastValue.value == "X"
                      ? Colors.blue
                      : Colors.pink,
                ).copyWith(
                  letterSpacing: 2,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black.withOpacity(0.4),
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                width: boardWidth,
                height: boardWidth,
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        itemCount: 9,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                        ),
                        padding: const EdgeInsets.all(16.0),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: controller.gameOver.value
                                ? null
                                : () {
                                    if (controller.board[index] == "") {
                                      controller.makeMove(index);
                                    }
                                  },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(16.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 6.0,
                                    offset: Offset(3, 3),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  controller.board[index],
                                  style: TextStyle(
                                    color: controller.board[index] == "X"
                                        ? Colors.blue
                                        : Colors.pink,
                                    fontSize: 64.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25.0),
              Text(
                controller.result.value,
                style: const TextStyle(color: Colors.black, fontSize: 24.0),
              ),
              ElevatedButton.icon(
                onPressed: controller.resetGame,
                icon: const Icon(
                  Icons.refresh,
                  size: 28,
                  color: Colors.white,
                ),
                label: Text(
                  "Restart Game",
                  style: GoogleFonts.acme(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
