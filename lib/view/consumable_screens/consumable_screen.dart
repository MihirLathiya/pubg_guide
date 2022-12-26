import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pubg_guide/app_data.dart';
import 'package:pubg_guide/widget/app_color.dart';
import 'package:pubg_guide/widget/common_appbar.dart';
import 'package:pubg_guide/widget/common_text.dart';

class ConsumableScreen extends StatefulWidget {
  const ConsumableScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ConsumableScreen> createState() => _ConsumableScreenState();
}

class _ConsumableScreenState extends State<ConsumableScreen> {
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
          title: 'Consumable'.toUpperCase(),
        ),
      ),
      body: ListView.separated(
        itemCount: (allAppData['consumables'] as List).length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return gunView(
            font: font,
            size: size,
            onPress: () {},
            angle: 0,
            index: index,
            imagePath: allAppData['consumables'][index]['url_image_asset'],
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

Widget gunView(
    {onPress,
    double? size,
    double? font,
    double? angle = 0,
    int? index,
    String? imagePath}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    height: 100 * size!,
    width: Get.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1000),
      color: AppColor.white,
    ),
    child: Container(
      color: Colors.black38,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
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
                  text: allAppData['consumables'][index]['name'],
                  color: AppColor.white,
                  size: 20 * font!,
                ),
                SizedBox(
                  height: 3 * size,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      text: 'Time Taken',
                      color: AppColor.white,
                    ),
                    CommonText(
                      text: allAppData['consumables'][index]['features']
                          ['Time Taken'],
                      color: AppColor.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      text: 'Capacity',
                      color: AppColor.white,
                    ),
                    CommonText(
                      text: allAppData['consumables'][index]['features']
                          ['Capacity'],
                      color: AppColor.white,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
