import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pubg_guide/app_data.dart';
import 'package:pubg_guide/view/weapon_screens/weapon_details_screen.dart';
import 'package:pubg_guide/widget/app_color.dart';
import 'package:pubg_guide/widget/common_appbar.dart';
import 'package:pubg_guide/widget/common_button.dart';

class WeaponCategoriesScreen extends StatefulWidget {
  const WeaponCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<WeaponCategoriesScreen> createState() => _WeaponCategoriesScreenState();
}

class _WeaponCategoriesScreenState extends State<WeaponCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 414;
    double font = size * 0.97;

    return Scaffold(
        backgroundColor: AppColor.black,
        appBar: PreferredSize(
          preferredSize: Size(
            Get.width,
            size * 100,
          ),
          child: CommonAppBar(
            size: size,
            font: font,
            title: 'Weapon'.toUpperCase(),
          ),
        ),
        body: ListView.separated(
          itemCount: (allAppData['weapons_categories'] as List).length,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return CommonButton(
              onPress: () {
                Get.to(
                  () => WeaponDetailsScreen(
                      appBarTitle: allAppData['weapons_categories'][index]
                          ['name'],
                      weaponList: allAppData['weapons_categories'][index]
                          ['weapons']),
                );
              },
              title: allAppData['weapons_categories'][index]['name'],
              angle: 5.6,
              imagePath: allAppData['weapons_categories'][index]
                  ['image_assets'],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 30,
            );
          },
        ));
  }
}
