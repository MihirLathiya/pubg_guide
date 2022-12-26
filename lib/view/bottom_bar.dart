import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pubg_guide/controller/bottom_bar_controller.dart';
import 'package:pubg_guide/view/categorie_screen.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({Key? key}) : super(key: key);

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  BottomController bottomController = Get.put(BottomController());
  List pages = [
    const CategoriesScreen(),
    Container(),
    Container(),
  ];

  List<IconData> listMenu = [
    Icons.home_outlined,
    Icons.map_outlined,
    Icons.compare_outlined
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: 60,
              width: Get.width - 50,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(
                    listMenu.length,
                    (index) => IconButton(
                      onPressed: () {
                        bottomController.selectItem(index);
                      },
                      icon: Icon(
                        listMenu[index],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
        body: pages[bottomController.selectedPage.value],
      ),
    );
  }
}
