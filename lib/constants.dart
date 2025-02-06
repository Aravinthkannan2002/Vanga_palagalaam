import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:vanga_palagalam/app/modules/about/views/about_view.dart';
import 'package:vanga_palagalam/app/modules/home/views/home_view.dart';
import 'package:vanga_palagalam/app/modules/login/views/login_view.dart';
import 'package:vanga_palagalam/app/modules/settings/views/settings_view.dart';

var defaultBackgroundColor = Colors.grey[300];
var appBarColor = Colors.purple;

var myAppBar = AppBar(
  iconTheme: IconThemeData(color: Colors.white),
  backgroundColor: appBarColor,
  title: Text(
    'Vanga Palagalam',
    style: GoogleFonts.acme(color: Colors.white),
  ),
  centerTitle: true,
);

var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);

Widget buildDrawerTile({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
  TextStyle? textStyle,
}) {
  return Padding(
    padding: tilePadding,
    child: ListTile(
      leading: Icon(icon),
      title: Text(title, style: textStyle),
      onTap: onTap,
    ),
  );
}

Future<void> logoutDialog(BuildContext context) async {
  await QuickAlert.show(
    context: context,
    type: QuickAlertType.confirm,
    text: 'Do you want to logout?',
    confirmBtnText: 'Yes',
    cancelBtnText: 'No',
    confirmBtnColor: Colors.red,
    onConfirmBtnTap: () {
      // Close the dialog
      Get.back();

      // Navigate to the login screen using GetX
      Get.to(() => LoginView());
    },
    onCancelBtnTap: () {
      // Close the dialog if the user cancels
      Get.back();
    },
  );
}

var myDrawer = Builder(
  builder: (context) => Drawer(
    backgroundColor: Colors.grey[300],
    elevation: 0,
    child: Column(
      children: [
        DrawerHeader(
          child: Icon(
            Icons.favorite,
            size: 64,
            color: Colors.purple,
          ),
        ),
        buildDrawerTile(
          icon: Icons.home,
          title: 'D A S H B O A R D',
          onTap: () {
            Get.to(HomeView()); // Invoke the logout dialog here
          },
          textStyle: TextStyle(color: Colors.grey[600]),
        ),
        buildDrawerTile(
          icon: Icons.settings,
          title: 'S E T T I N G S',
          onTap: () {
            Get.to(SettingsView()); // Invoke the logout dialog here
          },
          textStyle: TextStyle(color: Colors.grey[600]),
        ),
        buildDrawerTile(
          icon: Icons.info,
          title: 'A B O U T',
          onTap: () {
            Get.to(AboutView()); // Invoke the logout dialog here
          },
          textStyle: TextStyle(color: Colors.grey[600]),
        ),
        buildDrawerTile(
          icon: Icons.logout,
          title: 'L O G O U T',
          onTap: () {
            logoutDialog(context); // Invoke the logout dialog here
          },
          textStyle: TextStyle(color: Colors.grey[600]),
        ),
      ],
    ),
  ),
);
