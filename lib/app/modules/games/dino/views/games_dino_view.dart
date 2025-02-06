import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/games_dino_controller.dart';

class GamesDinoView extends GetView<GamesDinoController> {
    final controller = Get.put(GamesDinoController());
   GamesDinoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Custom back arrow
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: Text(
          'Dino Game',
          style: GoogleFonts.acme(), // Use the Acme font here
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTapDown: (_) => controller.jump(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.lightBlue.shade200],
            ),
          ),
          child: Stack(
            children: [
              // Ground
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),

              // Dino
              Obx(() => Positioned(
                  left: 50,
                  bottom: 100 - controller.dinoY.value,
                  child: Container(
                    width: 30,
                    height: 50,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset(
                      'assets/images/dino1.png', // replace with your image path
                      fit: BoxFit
                          .cover, // adjust based on how you want the image to fit
                    ),
                  ))),

              // Obstacles
              Obx(() => Stack(
                    children: controller.obstacleX.asMap().entries.map((entry) {
                      return Positioned(
                          left: entry.value,
                          bottom: 80 + controller.obstacleY[entry.key],
                          child: Container(
                            width: 100,
                            height: 100, // increased height
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset(
                              'assets/images/tree.png', // replace with your image path
                              fit: BoxFit
                                  .fill, // adjust based on how you want the image to fit
                            ),
                          ));
                    }).toList(),
                  )),

              // Score
              Positioned(
                top: 20,
                right: 30,
                child: Obx(() => Text(
                      'Score: ${controller.score.value}',
                      style: GoogleFonts.acme(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    )),
              ),

              // High Score
              Positioned(
                top: 50,
                right: 30,
                child: Obx(() => Text(
                      'High Score: ${controller.highScore.value}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    )),
              ),

              // Game Over Screen
              Obx(
                () => controller.isGameOver.value
                    ? Center(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Game Over',
                                style: TextStyle(
                                  fontSize: 48,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Score: ${controller.score.value}',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: controller.startGame,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 15,
                                  ),
                                ),
                                child: Text(
                                  'Play Again',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
