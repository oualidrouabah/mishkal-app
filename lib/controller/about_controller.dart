import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutController extends GetxController {
   final String title = 'تطبيق مشكال للجوال';
  final String description = '''
مشكال هو تطبيق جوال تم تطويره باستخدام فلاتر، وهو مبني على موقع مشكال. يهدف إلى إضافة التشكيل للنصوص العربية.
''';

  final String features = '''
- دعم التشكيل: يضيف التشكيل تلقائيًا إلى النصوص العربية لتحسين القراءة.
- واجهة مستخدم سهلة: واجهة مستخدم سهلة الاستخدام مصممة لتبسيط التفاعل، مع دعم كامل للغة العربية.
- محسّن للأجهزة المحمولة: يتكيف التطبيق بشكل مثالي مع الأجهزة المحمولة لتوفير تجربة سلسة.
''';

 final String credits = '''
هذا التطبيق مبني على مشروع مشكال الأصلي الذي أنشأه الدكتور طه زروقي. يستخدم المشروع واجهة برمجة تطبيقات مشكال لعملية تشكيل النصوص العربية.
للاطلاع على مشروعه على GitHub، يمكنك زيارة: https://github.com/linuxscout
''';

  void openWebsite(website) {
    _launchURL(website);
  }

  Future<void> _launchURL(url) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        Get.snackbar('خطأ', 'لا يمكن فتح $url');
        
      }
    } catch (e) {
      Get.snackbar('خطأ', 'حدث خطأ: $e');
      print(e);
    }
  }

}
