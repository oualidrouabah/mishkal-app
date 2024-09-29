import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  // Observable boolean to track dark mode status
  var isDarkMode = false.obs;

  // Method to toggle between light and dark mode
  void toggleTheme() {
    // Flip the value of isDarkMode
    isDarkMode.value = !isDarkMode.value;

    // Update the theme mode based on the isDarkMode value
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
