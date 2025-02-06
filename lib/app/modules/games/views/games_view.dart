import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vanga_palagalam/app/modules/games/Tic-Tact-Toe-Game/views/games_tic_tact_toe_game_view.dart';
import 'package:vanga_palagalam/app/modules/games/dino/views/games_dino_view.dart';
import 'package:vanga_palagalam/app/modules/games/quiz/views/games_quiz_view.dart';
import 'package:vanga_palagalam/app/modules/games/snakcobra/views/games_snakcobra_view.dart';
import 'package:vanga_palagalam/app/modules/home/views/home_view.dart';
import '../../../../widgets/loader/loadingDialog.dart';
import '../controllers/games_controller.dart';

class GamesView extends GetView<GamesController> {
  const GamesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(HomeView()); // Navigate back to the previous screen
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Games',
          style: GoogleFonts.acme(
            color: const Color(0xFF4A4A4A),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Choose your category:',
                style: GoogleFonts.acme(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2D2D2D),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _buildCategoryCard(
                      title: 'Tic Tac Toe',
                      gradient: const LinearGradient(
                        colors: [Color(0xFFE040FB), Color(0xFFAB47BC)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      icon: Icons
                          .sports_esports, // You can use an appropriate icon, like 'sports_esports' here
                      iconBackgroundColor: Colors.white24,
                      onTap: () async {
                        // Show the loading dialog when category is tapped
                        showDialog(
                          context: context,
                          barrierDismissible:
                              false, // Prevent dismissing the dialog by tapping outside
                          builder: (BuildContext context) =>
                              const LoadingDialog(),
                        );

                        // Simulate some async task (like fetching data or navigating)
                        await Future.delayed(const Duration(seconds: 2));

                        // Close the loading dialog
                        Get.to(() => GamesTicTactToeGameView());
                        // Perform any other action here (e.g., navigate to a new screen)
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildCategoryCard(
                      title: 'Quiz',
                      gradient: const LinearGradient(
                        colors: [Color(0xFF29B6F6), Color(0xFF0288D1)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      icon: Icons.quiz, // Quiz icon
                      iconBackgroundColor: Colors.white24,
                      onTap: () async {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) =>
                              const LoadingDialog(),
                        );

                        await Future.delayed(const Duration(seconds: 3));

                        Navigator.of(context).pop(); // Close the loading dialog

                        Get.to(() =>
                            GamesQuizView()); // Navigate to the next screen using GetX
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildCategoryCard(
                      title: 'Dino Adventure', // Name of the game
                      gradient: const LinearGradient(
                        colors: [Color(0xFF9575CD), Color(0xFF5E35B1)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      icon: Icons.gamepad, // Icon representing the game
                      iconBackgroundColor: Colors.white24,
                      onTap: () async {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) =>
                              const LoadingDialog(),
                        );

                        await Future.delayed(const Duration(seconds: 2));

                        Navigator.of(context).pop();

                        Get.to(() => GamesDinoView());
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required Gradient gradient,
    required IconData icon,
    required Color iconBackgroundColor,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: onTap, // Use the passed onTap function
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: iconBackgroundColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    icon,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.acme(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Tap to start quiz',
                        style: GoogleFonts.acme(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
