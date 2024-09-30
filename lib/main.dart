import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mishkal/view/splash_screen.dart';
import 'package:mishkal/view/theme.dart';

import 'controller/tashkil_controller.dart';

void main() {
  Get.put(TashkilController()); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
      title: "Mishkal app",
      locale:const Locale('ar', 'DZ'),
      fallbackLocale: const Locale('en', 'US'),
      theme: MishkalTheme.lightTheme,
      darkTheme: MishkalTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
  
}