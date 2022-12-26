import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pubg_guide/view/weapon_screens/weapon_screen.dart';
import 'package:pubg_guide/widget/app_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<String> splash = [
    AppImages.splashLogo,
    AppImages.splashLogo1,
    AppImages.splashLogo2,
    AppImages.splashLogo3,
    AppImages.splashLogo4,
  ];
  int selectSplash = 0;
  @override
  void initState() {
    selectSplash = Random().nextInt(splash.length);
    Timer(Duration(seconds: 3), () {
      Get.offAll(() => WeaponScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('RANDOM LEANGHT :- ${selectSplash}');
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Image.asset(
          splash[selectSplash],
        ),
      ),
    );
  }
}
