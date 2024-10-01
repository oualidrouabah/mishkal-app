import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  static final Color ocrButtonColor = Color(0xFF4CAF50); 
  static final Color cameraButtonColor = Color(0xFF2196F3); 
  static final Color clearButtonColor=Color(0xFFE94A4A);
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
