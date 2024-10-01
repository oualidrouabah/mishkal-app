// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mishkal/controller/database_controller.dart';
import 'package:mishkal/controller/tashkil_controller.dart';
import '../controller/theme_controller.dart';


class TashkilPage extends StatelessWidget {
  final TextEditingController textInputController = TextEditingController();
  final ThemeController themeController = Get.put(ThemeController());
  final TashkilController tashkilController = Get.put(TashkilController());
  final DatabaseController databaseController=Get.put(DatabaseController());

  TashkilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تشكيل النص',
          style: TextStyle(fontFamily: 'ArabicFont', fontSize: screenSize.width * 0.05),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input TextField
            Container(
              height: screenSize.height * 0.3,
              child: TextField(
                controller: textInputController,
                textAlign: TextAlign.right, // Align text for Arabic
                maxLines: null,
                expands: true,
                style: TextStyle(fontSize: screenSize.width * 0.05, fontFamily: 'ArabicFont'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'أدخل النص هنا...',
                  /*suffixIcon: Column(
                    mainAxisSize: MainAxisSize.min, // To avoid extra space
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete_outline),
                        color: ThemeController.clearButtonColor, // Using theme color for clear button
                        onPressed: () {
                          textInputController.clear(); // Clear the text field
                        },
                      ),
                      Obx(()=> IconButton(
                        icon: Icon(Icons.drive_folder_upload_outlined), // Use your OCR icon
                        color: ThemeController.ocrButtonColor, // Using theme color for OCR button
                        onPressed: () {
                          // Add OCR action here
                          print("Get text from picture action pressed");
                        },
                      )),      
                      IconButton(
                        icon: Icon(Icons.camera_alt_outlined),
                        color: ThemeController.cameraButtonColor, // Using theme color for camera button
                        onPressed: () {
                          // Add camera action here
                          print("Take picture action pressed");
                        },
                      ),
                    ],
                  ),*/
                ),
              ),
            ),
            SizedBox(height: 20),
            // Output TextField (Updated with RichText)
            Obx(() => Container(
                  height: screenSize.height * 0.4,
                  child: SingleChildScrollView(
                    child: SelectableText.rich(
                      textAlign: TextAlign.right,
                      _buildTextWithTashkil(
                        tashkilController.tashkilText.value,
                        Theme.of(context).primaryColor,  
                        Colors.red,                     
                        screenSize.width * 0.08,         
                      ),
                    ),
                  ),
                )),
            SizedBox(height: 20),

            // Button to fetch Tashkil
            IconButton(
              onPressed: () async {
                if (textInputController.text.isNotEmpty) {
                  await tashkilController.fetchTashkil(textInputController.text);
                  databaseController.addTextToHistory(textInputController.text, tashkilController.tashkilText.value);
                  print(databaseController.history);
                }

                
              },
              icon: Text(
                'تشكيل',
                style: TextStyle(fontSize: screenSize.width * 0.05, fontFamily: 'ArabicFont'),
              ),
              style: ButtonStyle(
                fixedSize: const WidgetStatePropertyAll(Size(190, 70)),
                padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
                backgroundColor: WidgetStateProperty.all(Theme.of(context).primaryColor),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build TextSpan with different colors for base text and tashkil
  TextSpan _buildTextWithTashkil(String text, Color normalColor, Color tashkilColor, double fontSize) {
    List<TextSpan> spans = [];
    final tashkilRegex = RegExp(r'[\u064B-\u065F]'); // Regex for tashkil characters

    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      // Check if the character is a tashkil (diacritic)
      if (tashkilRegex.hasMatch(char)) {
        spans.add(
          TextSpan(
            text: char,
            style: TextStyle(
              color: tashkilColor, // Color for tashkil
              fontSize: fontSize,
              fontFamily: 'ArabicFont',
            ),
          ),
        );
      } else {
        // Add base text with normal color
        spans.add(
          TextSpan(
            text: char,
            style: TextStyle(
              color: normalColor, // Color for normal text
              fontSize: fontSize,
              fontFamily: 'ArabicFont',
            ),
          ),
        );
      }
    }

    return TextSpan(children: spans);
  }
}
