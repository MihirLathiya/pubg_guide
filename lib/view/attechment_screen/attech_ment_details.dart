import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pubg_guide/app_data.dart';
import 'package:pubg_guide/widget/app_color.dart';
import 'package:pubg_guide/widget/common_appbar.dart';
import 'package:pubg_guide/widget/common_text.dart';

class AttachmentDetailsScreen extends StatefulWidget {
  final String? appBarTitle;
  final List<int>? attachmentList;
  const AttachmentDetailsScreen(
      {Key? key, this.appBarTitle, this.attachmentList})
      : super(key: key);

  @override
  State<AttachmentDetailsScreen> createState() =>
      _AttachmentDetailsScreenState();
}

class _AttachmentDetailsScreenState extends State<AttachmentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    log('ATTACHMENT :- ${widget.attachmentList}');
    log('TITLE :- ${widget.appBarTitle}');
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
            size: size, font: font, title: widget.appBarTitle!.toUpperCase()),
      ),
      body: ListView.separated(
        itemCount: (allAppData['attachments'] as List).length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          if (widget.attachmentList!
              .contains(int.parse(allAppData['attachments'][index]['id']))) {
            return gunView(
              font: font,
              size: size,
              onPress: () {},
              angle: 0,
              index: index,
              imagePath: allAppData['attachments'][index]['url_image_asset'],
            );
          } else {
            return const SizedBox();
          }
        },
        separatorBuilder: (context, index) {
          if (widget.attachmentList!
              .contains(int.parse(allAppData['attachments'][index]['id']))) {
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
                  text: allAppData['attachments'][index]['name'],
                  color: AppColor.white,
                  size: 20 * font!,
                  maxLine: 3,
                  overFlow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 15 * size,
          ),
          InkWell(
            onTap: () {},
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
