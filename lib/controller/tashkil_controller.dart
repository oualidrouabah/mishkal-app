import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For JSON decoding

class TashkilController extends GetxController {
  var tashkilText = ''.obs;

  // Method to fetch Tashkil text
 Future<void> fetchTashkil(String text) async {
  try {
    var url = Uri.parse('http://tahadz.com/mishkal/ajaxGet');
    var response = await http.get(url.replace(queryParameters: {
      'text': text,
      'action': 'TashkeelText',
    }));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['result'] == ' Zerrouki Taha') {
        print('Invalid text');
        tashkilText.value=" أدْخِل النَّصّ الْمُرَاد تَشْكِيلهُ";
        return;
      }
      else {
        tashkilText.value = data['result']; // Update immediately
        print('Tashkil text: ${tashkilText.value}');
      }
    } else {
      print('Failed to load Tashkil text');
    }
  } catch (e) {
    print('Error: $e');
  }
}

}