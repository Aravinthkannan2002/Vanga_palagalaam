import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void showSnackbar({
  required String title,
  required String message,
  required ContentType type,
}) {
  Get.snackbar(
    padding: EdgeInsets.all(10),
    "",
    "",
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.transparent,
    snackStyle: SnackStyle.FLOATING,
    margin: const EdgeInsets.all(16),
    messageText: AwesomeSnackbarContent(
      title: title,
      titleTextStyle: GoogleFonts.acme(color: Colors.white, fontSize: 24),
      message: message,
      messageTextStyle: GoogleFonts.acme(color: Colors.white),
      contentType: type,
    ),
  );
}
