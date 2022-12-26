import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pubg_guide/widget/app_color.dart';
import 'package:pubg_guide/widget/common_appbar.dart';

class MapView extends StatelessWidget {
  final String? image;
  final String? name;
  const MapView({Key? key, this.image, this.name}) : super(key: key);

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
          title: '$name'.toUpperCase(),
        ),
      ),
      body: InteractiveViewer(
        child: Image.asset(
          image!,
          height: Get.height,
          width: Get.width,
        ),
      ),
    );
  }
}
