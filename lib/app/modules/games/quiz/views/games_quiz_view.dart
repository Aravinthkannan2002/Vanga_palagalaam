import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../widgets/quiz/categoryscreen.dart';
import '../controllers/games_quiz_controller.dart';

class GamesQuizView extends GetView<GamesQuizController> {
    final controller = Get.put(GamesQuizController());
  GamesQuizView({super.key});

  
  final List<Map<String, dynamic>> categories = const [
    {
      'label': 'Science',
      'icon': Icons.science,
      'color': Colors.green,
    },
    {
      'label': 'History',
      'icon': Icons.history,
      'color': Colors.brown,
    },
    {
      'label': 'Technology',
      'icon': Icons.computer,
      'color': Colors.purple,
    },
    {
      'label': 'Mathematics',
      'icon': Icons.calculate,
      'color': Colors.blue,
    },
    {
      'label': 'Sports',
      'icon': Icons.sports,
      'color': Colors.orange,
    },
    {
      'label': 'Geography',
      'icon': Icons.public,
      'color': Colors.teal,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz Games',
          style: GoogleFonts.acme(color: Colors.white),
        ),
        backgroundColor:Colors.purple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
             Text(
              'Choose a Related Category',
              textAlign: TextAlign.center,
              style: GoogleFonts.acme(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 3 / 2, // Adjust height-to-width ratio
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return _buildCategoryCard(
                    context,
                    label: category['label'],
                    icon: category['icon'],
                    color: category['color'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildCategoryCard(
    BuildContext context, {
    required String label,
    required IconData icon,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(category: label),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color.withOpacity(0.2),
              child: Icon(
                icon,
                size: 28,
                color: color,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: GoogleFonts.acme(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
