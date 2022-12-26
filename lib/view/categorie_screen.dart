import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pubg_guide/app_data.dart';
import 'package:pubg_guide/view/ammo_screens/ammo_categories_screen.dart';
import 'package:pubg_guide/view/attechment_screen/attachment_categories.dart';
import 'package:pubg_guide/view/consumable_screens/consumable_screen.dart';
import 'package:pubg_guide/view/equipment_screens/equipment_screen.dart';
import 'package:pubg_guide/view/map_screens/map_screen.dart';
import 'package:pubg_guide/view/throwable_screens/throwable_screen.dart';
import 'package:pubg_guide/view/vehicle_screens/vehicle_screen.dart';
import 'package:pubg_guide/view/weapon_screens/weapon_categories.dart';
import 'package:pubg_guide/widget/app_color.dart';
import 'package:pubg_guide/widget/common_button.dart';
import 'package:pubg_guide/widget/common_text.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            CommonText(
              text: 'Categories',
              size: 35,
              color: AppColor.white,
              latterSpace: 2,
              weight: FontWeight.w600,
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    CommonButton(
                      onPress: () {
                        Get.to(() => const WeaponCategoriesScreen());
                      },
                      title: 'Weapons',
                      angle: 5.6,
                      imagePath: allAppData['weapons_categories'][0]
                          ['image_assets'],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonButton(
                      onPress: () {
                        Get.to(() => AttachmentCategoriesScreen());
                      },
                      title: 'Attachments',
                      angle: 0,
                      imagePath: allAppData['attachments_categories'][0]
                          ['image_assets'],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonButton(
                      onPress: () {
                        Get.to(() => AmmunitionScreen());
                      },
                      title: 'Ammo',
                      angle: 0,
                      imagePath: allAppData['ammo'][0]['url_image_asset'],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonButton(
                      onPress: () {
                        Get.to(() => MeleeScreen());
                      },
                      title: 'Melee',
                      imagePath: allAppData['melee'][0]['url_image_assets'],
                      angle: 5.6,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonButton(
                      onPress: () {
                        Get.to(() => EquipmentScreen());
                      },
                      title: 'Equipments',
                      imagePath: allAppData['equipments'][1]['url_image_asset'],
                      angle: 0,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonButton(
                      onPress: () {
                        Get.to(() => ConsumableScreen());
                      },
                      title: 'Consumables',
                      angle: 0,
                      imagePath: allAppData['consumables'][0]
                          ['url_image_asset'],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonButton(
                      onPress: () {
                        Get.to(() => VehicleScreen());
                      },
                      title: 'Vehicles',
                      imagePath: allAppData['vehicles'][0]['url_image_asset'],
                      angle: 0,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonButton(
                      onPress: () {
                        Get.to(() => MapScreen());
                      },
                      title: 'Maps',
                      imagePath: allAppData['maps'][0]['url_image_asset'],
                      angle: 0,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
