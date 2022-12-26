import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pubg_guide/widget/app_color.dart';
import 'package:pubg_guide/widget/common_text.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    Key? key,
    required this.size,
    required this.font,
    required this.title,
  }) : super(key: key);

  final double size;
  final double font;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.black,
      elevation: 0,
      leading: IconButton(
        splashRadius: 20,
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColor.white,
          size: 30 * font,
        ),
      ),
      centerTitle: true,
      title: CommonText(
        text: title,
        size: 23 * font,
        color: AppColor.white,
      ),
    );
  }
}
