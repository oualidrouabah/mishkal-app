import 'package:get/get.dart';

class TashkilController extends GetxController{
  var tashkil_text="".obs;
  String tashkil(String text){
    tashkil_text.value = text;
    return tashkil_text.value;
  }
}