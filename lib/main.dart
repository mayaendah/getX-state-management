import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxnilaiawal/home_view.dart';

import 'home_Controller.dart';



void main() {
  // Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
