import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mishkal/controller/theme_controller.dart';
import 'package:mishkal/view/about_screen.dart';
import 'package:mishkal/view/history_screen.dart';
import 'package:mishkal/view/tashkil_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ThemeController themeController = Get.put(ThemeController());

  

  @override
  Widget build(BuildContext context) {
    final Size screenSize = Get.size;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: cstmDrawer(),
        body: Container(
          padding: EdgeInsets.all(5),
          height: screenSize.height,
          width: screenSize.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RotatedBox(
                      quarterTurns: 135,
                      child: IconButton(
                        icon: const Icon(Icons.bar_chart_rounded),
                        color: Theme.of(context).primaryColor,
                        iconSize: screenSize.width * 0.08,
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                      ),
                    )
                  ],
                ),
                /*SizedBox(
                  height: screenSize.height * 0.2,
                  child: Image.asset(
                    'assets/mishkalphoto.png',
                    fit: BoxFit.fill,
                  ),
                ),*/
                 Column(
                  children: [
                    Image.asset(
                      'assets/dama.png',
                      width: 150,
                      height: 150,
                    ),
                    
                    Text(
                      "مِشْكَالٌ النُّصُوصُ الْعَرَبِيَّةِ",
                      style: TextStyle(
                        fontFamily: 'AmiriQuranColored',
                        fontSize: screenSize.width*0.11,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: IconButton(
                        onPressed: () => Get.to(() => TashkilPage()),
                        icon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.article,
                              size: screenSize.width * 0.13,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "تشكيل النص",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenSize.width * 0.08,
                                  fontFamily: 'ArabicFont'),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(
                              const EdgeInsets.only(
                                  top: 5, bottom: 5, left: 5, right: 5)),
                          backgroundColor: WidgetStateProperty.all(
                              Theme.of(context).primaryColor),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: IconButton(
                        onPressed: () => Get.to(() => HistoryScreen()),
                        icon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.history_edu_outlined,
                              size: screenSize.width * 0.13,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "سجل",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenSize.width * 0.08,
                                  fontFamily: 'ArabicFont'),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(
                              const EdgeInsets.only(
                                  top: 5, bottom: 5, left: 5, right: 5)),
                          backgroundColor: WidgetStateProperty.all(
                              Theme.of(context).primaryColor),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: IconButton(
                        onPressed: () => Get.to(() => AboutPage()),
                        icon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: screenSize.width * 0.13,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "حول التطبيق",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenSize.width * 0.08,
                                  fontFamily: 'ArabicFont'),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(
                              const EdgeInsets.only(
                                  top: 5, bottom: 5, left: 5, right: 5)),
                          backgroundColor: WidgetStateProperty.all(
                              Theme.of(context).primaryColor),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Drawer cstmDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(5),
        children: <Widget>[
          Column(
            children: [
              Image.asset(
                'assets/dama.png',
                width: 100,
                height: 100,
              ),
              SizedBox(height: 10),
              Text(
                "مِشْكَالٌ النُّصُوصُ الْعَرَبِيَّةِ",
                style: TextStyle(
                  fontFamily: 'AmiriQuranColored',
                  fontSize: 25,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(
              themeController.themeModeTitle.value,
              style: TextStyle(fontFamily: 'ArabicFont', fontSize: 25),
            ),
            trailing: GestureDetector(
              onTap: () {
                setState(() {
                  themeController.toggleTheme();
                  themeController.toggleThemeTitle();
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor,
                ),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                      top: 5.0,
                      left: themeController.isDarkMode.value ? 45.0 : 5.0,
                      right: themeController.isDarkMode.value ? 5.0 : 45.0,
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) {
                          return RotationTransition(
                            turns: child.key == ValueKey('sun')
                                ? Tween<double>(begin: 0.75, end: 1)
                                    .animate(animation)
                                : Tween<double>(begin: 0.25, end: 1)
                                    .animate(animation),
                            child: child,
                          );
                        },
                        child: themeController.isDarkMode.value
                            ? Icon(
                                Icons.nightlight_round,
                                key: ValueKey('moon'),
                                color: Colors.white,
                                size: 30,
                              )
                            : Icon(
                                Icons.wb_sunny,
                                key: ValueKey('sun'),
                                color: Colors.yellow,
                                size: 30,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
