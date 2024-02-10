import 'package:get/get.dart';

enum TabItem { home, clock, calendar, settings }

class ScreenController extends GetxController {
  Rx<TabItem> selectedTab = TabItem.home.obs;

  void changeTab(TabItem tabItem) {
    selectedTab.value = tabItem;
  }
}
