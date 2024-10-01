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
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever_outlined),
            color: ThemeController.clearButtonColor, 
            onPressed: () {
              textInputController.clear(); 
              tashkilController.clearText();
            },
          ),
        ],
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
                        ThemeController.clearButtonColor,                     
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
                  //print(databaseController.history);
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
