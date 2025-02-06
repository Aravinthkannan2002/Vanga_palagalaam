import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Goes back to the previous screen
          },
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.acme(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          CircleAvatar(
            radius: 100, // Outer Circle Avatar
            backgroundColor:
                Colors.blueGrey, // Background color if image is not loaded
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 90, // Inner Circle Avatar for the image
                  backgroundImage: AssetImage('assets/images/sathish.jpg'),
                  backgroundColor:
                      Colors.transparent, // In case the image is unavailable
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black
                          .withOpacity(0.5), // Semi-transparent background
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 28, // Adjust the size of the icon
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildSettingsItem(
            context,
            icon: Icons.account_circle,
            title: 'Account',
          ),
          _buildSettingsItem(
            context,
            icon: Icons.notifications,
            title: 'Notifications',
          ),
          _buildSettingsItem(
            context,
            icon: Icons.visibility,
            title: 'Appearance',
          ),
          _buildSettingsItem(
            context,
            icon: Icons.lock,
            title: 'Privacy & Security',
          ),
          _buildSettingsItem(
            context,
            icon: Icons.help,
            title: 'Help & Support',
          ),
          _buildSettingsItem(
            context,
            icon: Icons.info,
            title: 'About',
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context,
      {required IconData icon, required String title}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            // fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // Handle onTap functionality
        },
      ),
    );
  }
}
