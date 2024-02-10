import 'package:do_now/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart'; // Import GetX package

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            buildMenuItem(FontAwesomeIcons.user, "My Account"),
            buildDivider(),
            buildMenuItem(FontAwesomeIcons.themeisle, "Theme"),
            buildDivider(),
            buildMenuItem(FontAwesomeIcons.shield, "Security"),
            buildDivider(),
            buildMenuItem(FontAwesomeIcons.signOutAlt, "Log Out"),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String text) {
    return GestureDetector(
      onTap: () {
        if (text == "Log Out") {
          // Show a confirmation dialog for logout
          Get.defaultDialog(
            title: "Confirm Log Out",
            content: Text("Are you sure you want to log out?"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Get.back(); // Close the dialog
                  // Perform log out
                  AuthenticationService().signOut();
                },
                child: Text("Yes"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back(); // Close the dialog
                },
                child: Text("No"),
              ),
            ],
          );
        } else if (text == "Theme") {
          // Show a dialog box for theme selection
          bool isDarkMode = Get.isDarkMode; // Check the current theme mode

          Get.defaultDialog(
            title: "Select Theme",
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Do you want to switch to ${isDarkMode ? 'Light' : 'Dark'} mode?"),
                SizedBox(height: 20),
                SwitchListTile(
                  title: Text("Dark Mode"),
                  value: isDarkMode,
                  onChanged: (value) {
                    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light); // Change the theme mode
                  },
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Get.back(); // Close the dialog
                },
                child: Text("Close"),
              ),
            ],
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Row(
          children: [
            FaIcon(icon),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildDivider() {
    return Divider(
      thickness: 1,
      color: Colors.grey,
    );
  }
}
