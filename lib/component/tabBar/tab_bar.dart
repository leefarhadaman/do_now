// bottom_tab_bar.dart
import 'package:do_now/controller/Screen%20Controller/screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BottomTabBar extends StatelessWidget {
  final ScreenController screenController = Get.put(ScreenController());

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.home),
            onPressed: () {
              screenController.changeTab(TabItem.home);
            },
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.clock),
            onPressed: () {
              screenController.changeTab(TabItem.clock);
            },
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.height * 0.10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue, // Change color as needed
            ),
            child: IconButton(
              icon: FaIcon(FontAwesomeIcons.plus),
              color: Colors.white,
              onPressed: () {
                // Handle the plus button tap if needed
              },
            ),
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.calendar),
            onPressed: () {
              screenController.changeTab(TabItem.calendar);
            },
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.gears),
            onPressed: () {
              screenController.changeTab(TabItem.settings);
            },
          ),
        ],
      ),
    );
  }
}
