import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      drawer: myDrawer, // Pass the context here
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/home.png', // Replace with your image asset path
              fit: BoxFit
                  .cover, // Ensures the image covers the entire background
            ),
          ),

          // Main Content
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 20),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Learn, Play, and Excel Together!",
                        style: GoogleFonts.acme(
                          color: Colors.black,
                          fontSize: 36,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                Container(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      children: [
                        itemDashboard(
                          context,
                          'Chatbot',
                          CupertinoIcons.chat_bubble_2,
                          Colors.blue,
                          () => Get.toNamed(
                              '/chatbot'), // Navigate to Chatbot page
                        ),
                        itemDashboard(
                          context,
                          'Games',
                          CupertinoIcons.game_controller,
                          Colors.blue,
                          () => Get.toNamed('/games'), // Navigate to Games page
                        ),
                        itemDashboard(
                          context,
                          'Chat',
                          Icons.chat, // Replaced with Icons.chat
                          Colors.green,
                          () => Get.toNamed(
                            '/chat', // Navigate to Chat page
                          ),
                        ),
                        itemDashboard(
                          context,
                          'Todo',
                          CupertinoIcons.chart_bar,
                          Colors.purple,
                          () =>
                              Get.toNamed('/todoapp'), // Navigate to Grades page
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget itemDashboard(BuildContext context, String title, IconData iconData,
      Color background, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, // Action to perform on tap
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              title.toUpperCase(),
              style: GoogleFonts.acme(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
