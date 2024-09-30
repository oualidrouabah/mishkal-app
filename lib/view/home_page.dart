import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mishkal/view/history_screen.dart';
import 'package:mishkal/view/tashkil_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(5),
        child: SafeArea(
          child: Center(
            // ignore: sized_box_for_whitespace
            child: Container(
              height: screenSize.height*0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenSize.height * 0.2,
                    child: Image.asset(
                      'assets/mishkalphoto.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height:screenSize.height * 0.05,
                  ),
                  Container(
                    //color: Colors.yellow ,	
                    margin: const EdgeInsets.only(right: 5, left: 5),
                    child: StyledButton(
                      icon: Icons.article_outlined, 
                      text: "تشكيل النص", 
                      height:screenSize. height*0.2, 
                      width:screenSize. width, 
                      onPressed: ()=> Get.to(()=>TashkilPage()),
                    ),
                  ),
                  Container(
                    //color: Colors.red ,
                    margin: const EdgeInsets.only(right: 5, left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        StyledButton(
                          icon: Icons.info_outline, 
                          text: "حول التطبيق", 
                          height:screenSize.height *0.2, 
                          width: screenSize.width *0.46, 
                          onPressed: () {},
                        ),
                        StyledButton(
                          icon: Icons.history, 
                          text: "سجل", 
                          height: screenSize.height *0.2, 
                          width: screenSize.width *0.46, 
                          onPressed: ()=>Get.to(()=>HistoryScreen()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}

class StyledButton extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;

  const StyledButton(
      {super.key,
      this.icon,
      required this.text,
      required this.height,
      required this.width,
      required this.onPressed}
  );

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: (icon!=null)? Column(
        children: [
          Icon(
            icon,
            size: height! * 0.4,
            color: Colors.white,
          
          ),
          Text(
            text!,
            style: TextStyle(
              fontSize: height! * 0.17,
              color: Colors.white,
            ),
          ),
        ],
      ): Text(
        text!,
        style: TextStyle(
          fontSize: width! * 0.2,
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(Size(width!, height!)),
          padding: WidgetStateProperty.all(
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10)),
          backgroundColor:
              WidgetStateProperty.all(Theme.of(context).primaryColor),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(height!/4))),),
    );
  }
}