import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pubg_guide/app_data.dart';
import 'package:pubg_guide/view/weapon_screens/weapon_view.dart';
import 'package:pubg_guide/widget/app_color.dart';
import 'package:pubg_guide/widget/common_appbar.dart';
import 'package:pubg_guide/widget/common_text.dart';

class WeaponDetailsScreen extends StatefulWidget {
  final String? appBarTitle;
  final List<int>? weaponList;
  const WeaponDetailsScreen({Key? key, this.appBarTitle, this.weaponList})
      : super(key: key);

  @override
  State<WeaponDetailsScreen> createState() => _WeaponDetailsScreenState();
}

class _WeaponDetailsScreenState extends State<WeaponDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 414;
    double font = size * 0.97;
    log('Weapon List:- ${widget.weaponList}');
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
          title: widget.appBarTitle!.toUpperCase(),
        ),
      ),
      body: ListView.separated(
        itemCount: (allAppData['weapons'] as List).length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          if (widget.weaponList!
              .contains(int.parse(allAppData['weapons'][index]['id']))) {
            return gunView(
              font: font,
              size: size,
              onPress: () {},
              angle: 5.6,
              index: index,
              imagePath: allAppData['weapons'][index]['image_assets'],
            );
          } else {
            return const SizedBox();
          }
        },
        separatorBuilder: (context, index) {
          if (widget.weaponList!
              .contains(int.parse(allAppData['weapons'][index]['id']))) {
            return const SizedBox(
              height: 30,
            );
          } else {
            return const SizedBox(
              height: 0,
            );
          }
        },
      ),
    );
  }
}

Widget gunView(
    {onPress,
    double? size,
    double? font,
    double? angle = 0,
    int? index,
    String? imagePath}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    height: 90 * size!,
    width: Get.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1000),
      color: AppColor.white,
    ),
    child: Container(
      color: Colors.black38,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Transform.rotate(
            angle: angle!,
            child: Image.asset(
              imagePath!,
              height: 100 * size,
              width: 90 * size,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 15 * size,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  text: allAppData['weapons'][index]['name'],
                  color: AppColor.white,
                  size: 20 * font!,
                ),
                SizedBox(
                  height: 3 * size,
                ),
                CommonText(
                  text: allAppData['weapons'][index]['description'],
                  color: AppColor.white,
                  maxLine: 3,
                  overFlow: TextOverflow.ellipsis,
                  size: 15 * font,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 15 * size,
          ),
          InkWell(
            onTap: () {
              Get.to(
                () => WeaponViewScreen(
                  appBarTitle: allAppData['weapons'][index]['name'] ?? 'NA',
                  gunImage:
                      allAppData['weapons'][index]['image_assets'] ?? 'NA',
                  gunDescription:
                      allAppData['weapons'][index]['description'] ?? 'NA',
                  attachmentList:
                      allAppData['weapons'][index]['attachments'] ?? 'NA',
                  ammo: allAppData['weapons'][index]['weapon_details']
                          ['Ammo'] ??
                      'NA',
                  magazine: allAppData['weapons'][index]['weapon_details']
                          ['Magazine'] ??
                      'NA',
                  type: allAppData['weapons'][index]['weapon_details']
                          ['Type'] ??
                      'NA',
                  bulletSpeed: allAppData['weapons'][index]['weapon_details']
                          ['Bullet Speed'] ??
                      'NA',
                  timeBetween: allAppData['weapons'][index]['weapon_details']
                          ['Time Between'] ??
                      'NA',
                  readyDelay: allAppData['weapons'][index]['weapon_details']
                          ['Ready Delay'] ??
                      'NA',
                  extendMagazine: allAppData['weapons'][index]['weapon_details']
                          ['Extend Magazine'] ??
                      'NA',
                  damage: allAppData['weapons'][index]['weapon_details']
                          ['Damage'] ??
                      'NA',
                  firingMode: allAppData['weapons'][index]['weapon_details']
                          ['Firing Mode'] ??
                      'NA',
                  impact: allAppData['weapons'][index]['weapon_details']
                          ['Impact'] ??
                      'NA',
                  normalReload: allAppData['weapons'][index]['weapon_details']
                          ['Normal Reload'] ??
                      'NA',
                  pickUpDelay: allAppData['weapons'][index]['weapon_details']
                          ['Pickup Delay'] ??
                      'NA',
                  quickReload: allAppData['weapons'][index]['weapon_details']
                          ['Quick Reload'] ??
                      'NA',
                ),
              );
            },
            child: Icon(
              Icons.visibility,
              color: AppColor.white,
            ),
          )
        ],
      ),
    ),
  );
}
