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

  List<String> listMenu = [
    'assets/content/weapon.png',
    'assets/content/map.png',
    'assets/content/compare.png'
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 414;
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        bottomNavigationBar: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              height: 60,
              width: Get.width - 50,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(
                  50,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    listMenu.length,
                    (index) => Column(
                      children: [
                        Image.asset(
                          '${listMenu[index]}',
                          height: 30,
                          width: 30,
                        ),
                      ],
                    ),
                  )
                ],
              ),
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
