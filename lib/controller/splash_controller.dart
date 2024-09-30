import 'dart:async';

import 'package:get/get.dart';

import '../view/tashkil_page.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Navigate to the home page after 4 seconds
    Timer(Duration(seconds: 4), () {
      Get.off(()=>TashkilPage());
    });
  }
}
