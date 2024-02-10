import 'package:do_now/component/tabBar/tab_bar.dart';
import 'package:do_now/controller/Screen%20Controller/screen_controller.dart';
import 'package:do_now/view/screens/calender_event.dart';
import 'package:do_now/view/screens/main_screen.dart';
import 'package:do_now/view/screens/schedule_screen.dart';
import 'package:do_now/view/screens/setting_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ScreenController screenController = Get.put(ScreenController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 0, // No elevation
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.barsStaggered), // Menu icon
          onPressed: () {
            // Add onPressed functionality here
          },
        ),
        actions: [
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              size: 20,
            ), // Search icon
            onPressed: () {
              // Add onPressed functionality here
            },
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.solidBell), // Filter icon
            onPressed: () {
              // Add onPressed functionality here
            },
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.sliders), // Filter icon
            onPressed: () {
              // Add onPressed functionality here
            },
          ),
        ],
      ),
      body: Obx(() {
        switch (screenController.selectedTab.value) {
          case TabItem.home:
            return MainScreen();
          case TabItem.clock:
            return ScheduleScreen();
          case TabItem.calendar:
            return CalendarScreen();
          case TabItem.settings:
            return SettingsScreen();
          default:
            return Placeholder();
        }
      }),
      bottomNavigationBar: BottomTabBar(),
    );
  }
}
