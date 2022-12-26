import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pubg_guide/app_data.dart';
import 'package:pubg_guide/view/vehicle_screens/vehicle.dart';
import 'package:pubg_guide/widget/app_color.dart';
import 'package:pubg_guide/widget/common_appbar.dart';
import 'package:pubg_guide/widget/common_text.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
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
          title: 'Equipment'.toUpperCase(),
        ),
      ),
      body: ListView.separated(
        itemCount: (allAppData['vehicles'] as List).length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return gunView(
            font: font,
            size: size,
            onPress: () {},
            angle: 0,
            index: index,
            imagePath: allAppData['vehicles'][index]['url_image_asset'],
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
                Row(
                  children: [
                    CommonText(
                      text: allAppData['vehicles'][index]['name'],
                      color: AppColor.white,
                      size: 20 * font!,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => VehicleView(
                                image: allAppData['vehicles'][index]
                                    ['url_image_asset'],
                                name: allAppData['vehicles'][index]['name'],
                              ));
                        },
                        child: Icon(
                          Icons.visibility,
                          color: AppColor.white,
                        ))
                  ],
                ),
                SizedBox(
                  height: 3 * size,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      text: 'Health',
                      color: AppColor.white,
                    ),
                    CommonText(
                      text: allAppData['vehicles'][index]['features']['Health'],
                      color: AppColor.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      text: 'Top speed',
                      color: AppColor.white,
                    ),
                    CommonText(
                      text: allAppData['vehicles'][index]['features']
                          ['Top speed'],
                      color: AppColor.white,
                    )
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     CommonText(
                //       text: 'Occupants',
                //       color: AppColor.white,
                //     ),
                //     CommonText(
                //       text: allAppData['vehicles'][index]['features']
                //           ['Occupants'],
                //       color: AppColor.white,
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
