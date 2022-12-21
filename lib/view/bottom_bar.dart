import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pubg_guide/controller/bottom_bar_controller.dart';
import 'package:pubg_guide/view/weapon_screens/weapon_screen.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({Key? key}) : super(key: key);

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  BottomController bottomController = Get.put(BottomController());
  List pages = [
    WeaponScreen(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        bottomNavigationBar: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 100,
              width: Get.width - 20,
              color: Colors.indigo,
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
        body: pages[bottomController.selectedPage.value],
      ),
    );
  }
}
