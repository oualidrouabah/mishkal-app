// tashkil_controller.dart
import 'package:get/get.dart';
import '../databases/database.dart';
import 'dart:developer' as dev;

class DatabaseController extends GetxController {
  var history = <Map<String, String>>[].obs; // Keep the type as String
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    loadHistory();
  }

  void addTextToHistory(String originalText, String tashkilText) {
    // Check if the original text already exists in the history
    if (!history.any((entry) => entry['original_text'] == originalText)) {
      // If it doesn't exist, add it to the history and the database
      history.add({
        'original_text': originalText,
        'tashkil_text': tashkilText,
      });
      _databaseHelper.insertText(originalText, tashkilText);
    } else {
      // Optionally, you can show a message indicating that the text already exists
      dev.log("The original text already exists in the history.");
    }
  }

  Future<void> loadHistory() async {
    final List<Map<String, dynamic>> maps = await _databaseHelper.getHistory();
      history.value = maps.map((map) => {
        'original_text': map['original_text'] as String, // Cast to String
        'tashkil_text': map['tashkil_text'] as String,   // Cast to String
      }).toList(); // Convert to List<Map<String, String>>
    }
  
  void deleteTextFromHistory(String originalText) {
    // Remove from the in-memory list
    history.removeWhere((entry) => entry['original_text'] == originalText);
    // Remove from the database
    _databaseHelper.deleteText(originalText);
  }
}
