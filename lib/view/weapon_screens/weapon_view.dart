import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pubg_guide/app_data.dart';
import 'package:pubg_guide/widget/app_color.dart';
import 'package:pubg_guide/widget/common_appbar.dart';
import 'package:pubg_guide/widget/common_text.dart';

class WeaponViewScreen extends StatefulWidget {
  final String? appBarTitle,
      gunImage,
      gunDescription,
      type,
      ammo,
      damage,
      bulletSpeed,
      timeBetween,
      firingMode,
      impact,
      magazine,
      extendMagazine,
      pickUpDelay,
      readyDelay,
      normalReload,
      quickReload;
  final List? attachmentList;
  const WeaponViewScreen(
      {Key? key,
      this.appBarTitle,
      this.gunImage,
      this.gunDescription,
      this.attachmentList,
      this.type,
      this.ammo,
      this.damage,
      this.bulletSpeed,
      this.timeBetween,
      this.firingMode,
      this.impact,
      this.magazine,
      this.extendMagazine,
      this.pickUpDelay,
      this.readyDelay,
      this.normalReload,
      this.quickReload})
      : super(key: key);

  @override
  State<WeaponViewScreen> createState() => _WeaponViewScreenState();
}

class _WeaponViewScreenState extends State<WeaponViewScreen> {
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
          title: widget.appBarTitle!.toUpperCase(),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            InteractiveViewer(
              child: Image.asset(
                widget.gunImage!,
                height: 150 * size,
                width: Get.width,
              ),
            ),
            CommonText(
              text: widget.gunDescription!,
              color: AppColor.white,
              overFlow: TextOverflow.ellipsis,
              size: 15 * font,
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: AppColor.white,
            ),
            const SizedBox(
              height: 10,
            ),
            CommonText(
              text: 'Best Attachment Combo',
              color: AppColor.white,
              size: 20 * font,
            ),
            const SizedBox(
              height: 10,
            ),
            MasonryGridView.count(
              itemCount: (allAppData['attachments'] as List).length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              itemBuilder: (context, index) {
                if (widget.attachmentList!.contains(
                    int.parse(allAppData['attachments'][index]['id']))) {
                  return Container(
                    child: Column(
                      children: [
                        Image.asset(allAppData['attachments'][index]
                            ['url_image_asset']),
                        CommonText(
                          text: allAppData['attachments'][index]['name'],
                          color: AppColor.white,
                          size: 15 * font,
                        )
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              color: AppColor.white,
            ),
            const SizedBox(
              height: 10,
            ),
            CommonText(
              text: 'Weapon details',
              color: AppColor.white,
              size: 20 * font,
            ),
            data(value: widget.type, title: 'Type'),
            data(value: widget.ammo, title: 'Ammo'),
            data(value: widget.damage, title: 'Damage'),
            data(value: widget.bulletSpeed, title: 'Bullet Speed'),
            data(value: widget.timeBetween, title: 'Time Between'),
            data(value: widget.firingMode, title: 'Firing Mode'),
            data(value: widget.impact, title: 'Impact'),
            data(value: widget.magazine, title: 'Magazine'),
            data(value: widget.extendMagazine, title: 'Extend Magazine'),
            data(value: widget.pickUpDelay, title: 'PickUp Delay'),
            data(value: widget.readyDelay, title: 'Ready Delay'),
            data(value: widget.normalReload, title: 'Normal Reload'),
            data(value: widget.quickReload, title: 'Quick Reload'),
          ],
        ),
      ),
    );
  }
}

Widget data({String? title, String? value}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonText(
          text: title!,
          color: Colors.white,
        ),
        CommonText(
          text: value!,
          color: Colors.white,
        )
      ],
    ),
  );
}
