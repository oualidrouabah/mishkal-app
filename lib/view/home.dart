import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mishkal/controller/tashkil_controller.dart';

import '../controller/therme_controller.dart';

class HomePage extends StatelessWidget {
  final TextEditingController textInputController = TextEditingController();
  final TextEditingController textOutputController = TextEditingController();
  final ThemeController themeController = Get.put(ThemeController());

  final TashkilController c = Get.put(TashkilController());

  

  HomePage({super.key});

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
          Obx(() => IconButton(
                icon: Icon(themeController.isDarkMode.value
                    ? Icons.light_mode
                    : Icons.dark_mode),
                onPressed: () {
                  themeController.toggleTheme();
                },
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  hintText: 'أدخل النص هنا...',
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: screenSize.height*0.3,
              child: TextField(
                controller: textOutputController,
                textAlign: TextAlign.right, // Align text for Arabic
                maxLines: null,
                expands: true,
                style: TextStyle(fontSize: screenSize.width * 0.05, fontFamily: 'ArabicFont'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            IconButton(
              onPressed: () {
                textOutputController.text = c.tashkil(textInputController.text);
              },
              icon: Text(
                'تشكيل',
                style: TextStyle(fontSize: screenSize.width * 0.05, fontFamily: 'ArabicFont'),
              ),
              style: ButtonStyle(
                  fixedSize: const WidgetStatePropertyAll(Size(190, 70)),
                  padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
                  backgroundColor:
                      WidgetStateProperty.all(Theme.of(context).primaryColor),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)))),
            ),
          ],
        ),
      ),
    );
  }
}
