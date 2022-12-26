import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pubg_guide/widget/app_color.dart';
import 'package:pubg_guide/widget/common_text.dart';

class CommonButton extends StatelessWidget {
  final onPress;
  final String? imagePath;
  final String? title;
  final double? angle;
  const CommonButton(
      {Key? key, this.onPress, this.imagePath, this.title, this.angle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 414;
    double font = size * 0.97;

    return InkWell(
      onTap: onPress!,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 90 * size,
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
              Expanded(
                child: CommonText(
                  text: title!,
                  color: AppColor.white,
                  size: 25 * font,
                ),
              ),
              Transform.rotate(
                angle: angle!,
                child: Image.asset(
                  imagePath!,
                  height: 100 * size,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
