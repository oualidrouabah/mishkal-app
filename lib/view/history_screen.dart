import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/database_controller.dart';


class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});
  final DatabaseController _controller = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تاريخ التشكيل'),
      ),
      body: Obx(() {
        if (_controller.history.isEmpty) {
          return Center(child: Text('لا توجد سجلات متاحة.'));
        }
        return ListView.builder(
          itemCount: _controller.history.length,
          itemBuilder: (context, index) {
            final entry = _controller.history[index];
            return ListTile(
              isThreeLine: true,
              title: Text(entry['original_text']!),
              subtitle: Text(entry['tashkil_text']!),
              onTap: () {
                // Navigate to the detail screen when tapped
                _showDetailDialog(entry);
              },
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red,),
                onPressed: () {
                  _showDeleteConfirmationDialog(entry['original_text']!);
                },
              ),
            );
          },
        );
      }),
    );
  }

  void _showDetailDialog(Map<String, String> entry) {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text('تفاصيل'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('النص الأصلي: \n${entry['original_text']}', textAlign: TextAlign.right),
              SizedBox(height: 8),
              Text('نص التشكيل:\n${entry['tashkil_text']}', textAlign: TextAlign.right),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('إغلاق'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(String originalText) {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text('تأكيد الحذف'),
          content: Text('هل أنت متأكد أنك تريد حذف هذا السجل؟'),
          actions: [
            TextButton(
              onPressed: () {
                // If user confirms, delete the entry
                _controller.deleteTextFromHistory(originalText);
                Get.back();
              },
              child: Text('حذف'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('إلغاء'),
            ),
          ],
        );
      },
    );
  }
}
