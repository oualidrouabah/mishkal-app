import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/about_controller.dart';


class AboutPage extends StatelessWidget {
  AboutPage({super.key});
  
  final AboutController aboutController = Get.put(AboutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('حول التطبيق'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                aboutController.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                aboutController.description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Text(
                'سمات:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                aboutController.features,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Text(
                'الاعتمادات:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                aboutController.credits,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  aboutController.openWebsite("https://tahadz.com/mishkal");
                },
                child: Text(
                  'موقع مشكال',
                  style: TextStyle(fontSize: 18, color: Colors.blue, decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
