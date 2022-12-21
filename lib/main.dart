import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pubg_guide/view/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pubg Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppBottomBar(),
    );
  }
}
