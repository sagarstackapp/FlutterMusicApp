import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donloader_demo/localization/localization_key.dart';
import 'package:flutter_donloader_demo/screen/home_screen/home_screen.dart';
import 'package:get/get.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo of Audio player',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      locale: Get.deviceLocale,
      translationsKeys: translationKey,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  bool theme = true;

  @override
  Widget build(BuildContext context) {
    Get.printInfo(info: 'Current page --> $runtimeType');
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload File'.tr),
        actions: [
          CupertinoSwitch(
            activeColor: Colors.black,
            trackColor: Colors.white,
            dragStartBehavior: DragStartBehavior.start,
            value: theme,
            onChanged: (bool v) {
              setState(() {
                theme = v;
                changeTheme(theme);
              });
            },
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: mediaPlayer,
              child: Text('Media Player'.tr),
            ),
          ],
        ),
      ),
    );
  }

  mediaPlayer() {
    Get.to(() => HomePage(),
        transition: Transition.rightToLeft,
        duration: Duration(milliseconds: 800));
  }

  changeTheme(theme) {
    theme
        ? Get.changeTheme(ThemeData.light())
        : Get.changeTheme(ThemeData.dark());
  }
}
