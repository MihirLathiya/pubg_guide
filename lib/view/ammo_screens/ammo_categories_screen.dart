import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pubg_guide/app_data.dart';
import 'package:pubg_guide/view/ammo_screens/amo_view.dart';
import 'package:pubg_guide/widget/app_color.dart';
import 'package:pubg_guide/widget/common_appbar.dart';
import 'package:pubg_guide/widget/common_button.dart';

class AmmunitionScreen extends StatefulWidget {
  const AmmunitionScreen({Key? key}) : super(key: key);

  @override
  State<AmmunitionScreen> createState() => _AmmunitionScreenState();
}

class _AmmunitionScreenState extends State<AmmunitionScreen> {
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
          title: 'Ammunition'.toUpperCase(),
        ),
      ),
      body: ListView.separated(
        itemCount: (allAppData['ammo'] as List).length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return CommonButton(
            onPress: () {
              Get.to(
                () => AmmoViewScreen(
                  ammoImage: allAppData['ammo'][index]['url_image_asset'],
                  amoDescription: allAppData['ammo'][index]['description'],
                  pickUpDelay: allAppData['ammo'][index]['features']
                      ['Pickup delay'],
                  appBarTitle: allAppData['ammo'][index]['name'],
                  capacity: allAppData['ammo'][index]['features']['capacity'],
                  type: allAppData['ammo'][index]['name'],
                  readyDelay: allAppData['ammo'][index]['features']
                      ['Ready delay'],
                  weaponList: allAppData['ammo'][index]['attachable_weapons'],
                ),
              );
            },
            title: allAppData['ammo'][index]['name'],
            angle: 0,
            imagePath: allAppData['ammo'][index]['url_image_asset'],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 30,
          );
        },
      ),
    );
  }
}
