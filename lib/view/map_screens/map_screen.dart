import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pubg_guide/app_data.dart';
import 'package:pubg_guide/view/map_screens/map_view.dart';
import 'package:pubg_guide/widget/app_color.dart';
import 'package:pubg_guide/widget/common_appbar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
          title: 'Map'.toUpperCase(),
        ),
      ),
      body: ListView.separated(
        itemCount: (allAppData['maps'] as List).length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return gunView(
            font: font,
            size: size,
            onPress: () {},
            angle: 0,
            index: index,
            imagePath: allAppData['maps'][index]['url_image_asset'],
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
  return GestureDetector(
    onTap: () {
      Get.to(() => MapView(
            image: allAppData['maps'][index]['url_image_asset'],
            name: allAppData['maps'][index]['name'],
          ));
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 150 * size!,
      width: Get.width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: AppColor.white,
      ),
      child: Container(
        color: Colors.black38,
        child: Row(
          children: [
            Transform.rotate(
              angle: angle!,
              child: Image.asset(
                imagePath!,
                height: 150 * size,
                width: Get.width,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
