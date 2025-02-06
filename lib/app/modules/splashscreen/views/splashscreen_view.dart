import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/splashscreen_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<SplashscreenController>(builder: (controller) {
        return Center(
          child: Stack(
            children: [
              // Fullscreen Image
              SizedBox.expand(
                child: Image.asset(
                  "assets/images/splashscreen.jpg",
                  fit: BoxFit.cover, // Cover the entire screen
                ),
              ),
              // Additional content (if any)
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "Vanga Palagalam",
                          textStyle: GoogleFonts.acme(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          speed: Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 1, // Animates only once
                      pause: Duration(milliseconds: 100),
                    ),
                    // SizedBox(height:10),
                    Container(
                      height: 250,
                      width: 250,
                      child: Lottie.asset('assets/Animations/loader.json'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
