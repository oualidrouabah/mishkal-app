import 'dart:developer' as dev;

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TashkilController extends GetxController {
  
  var tashkilText = ''.obs;
  // To store ordered lines from the API
  final _tashkilResults = <int, String>{}; 

  // Method to fetch Tashkil text (supporting multiple lines)
  Future<void> fetchTashkil(String text) async {
    _tashkilResults.clear(); // Clear previous results
    try {
      // Send API request (assuming the API splits text into lines)
      var url = Uri.parse('http://tahadz.com/mishkal/ajaxGet');
      var response = await http.get(url.replace(queryParameters: {
        'text': text,
        'action': 'TashkeelText',
      }));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        // Extract the result and order
        String result = data['result'];
        if (result == ' Zerrouki Taha') {
          tashkilText.value=" أدْخِل النَّصّ الْمُرَاد تَشْكِيلهُ";
          return;
        }
        else {
        int order = int.parse(data['order']); // Extract order as integer

        // Add the result to the map based on its order
        _tashkilResults[order] = result;

        // Combine the results based on the order
        tashkilText.value = _combineResultsInOrder();
        }

      } else {
        dev.log('Failed to load Tashkil text');
      }
    } catch (e) {
      dev.log('Error: $e');
      throw Exception('Failed to fetch Tashkil text');
    }
  }

  // Combine the results in order
  String _combineResultsInOrder() {
    var sortedEntries = _tashkilResults.entries.toList();
    sortedEntries.sort((a, b) => a.key.compareTo(b.key)); // Sort by order
    return sortedEntries.map((entry) => entry.value).join(' '); // Combine them into a single string
  }

  void clearText() {
    tashkilText.value = ""; 
  }
}
