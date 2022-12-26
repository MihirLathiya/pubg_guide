import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pubg_guide/app_data.dart';
import 'package:pubg_guide/view/attechment_screen/attech_ment_details.dart';
import 'package:pubg_guide/widget/app_color.dart';
import 'package:pubg_guide/widget/common_appbar.dart';
import 'package:pubg_guide/widget/common_button.dart';

class AttachmentCategoriesScreen extends StatefulWidget {
  const AttachmentCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<AttachmentCategoriesScreen> createState() =>
      _AttachmentCategoriesScreenState();
}

class _AttachmentCategoriesScreenState
    extends State<AttachmentCategoriesScreen> {
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
          title: 'Attachment'.toUpperCase(),
        ),
      ),
      body: ListView.separated(
        itemCount: (allAppData['attachments_categories'] as List).length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return CommonButton(
            onPress: () {
              log('LIST :- ${allAppData['attachments_categories'][index]['attachments']}');
              Get.to(
                () => AttachmentDetailsScreen(
                  appBarTitle: allAppData['attachments_categories'][index]
                      ['name'],
                  attachmentList: allAppData['attachments_categories'][index]
                      ['attachments'],
                ),
              );
            },
            title: allAppData['attachments_categories'][index]['name'],
            angle: 0,
            imagePath: allAppData['attachments_categories'][index]
                ['image_assets'],
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
