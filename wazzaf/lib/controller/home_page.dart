import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzaf/core/class/class_for_val/map_pages.dart';

abstract class HomePage extends GetxController {
  void changePage(int index);
}

class HomePageController extends HomePage {
  int isSelected = 0;
  List<MapPage> pages = [
    MapPage(title: 'الرئيسية', icon: Icons.home_filled, route: () {}),
    MapPage(
      title: 'طلباتي',
      icon: Icons.free_cancellation_rounded,
      route: () {},
    ),
    MapPage(title: 'اضافة طلب', icon: Icons.add_circle_sharp, route: () {}),
    MapPage(title: 'الرسائل', icon: Icons.message, route: () {}),
    MapPage(title: 'wazzaf', icon: Icons.home_filled, route: () {}),
  ];

  @override
  void changePage(int index) {
    isSelected = index;
    update();
  }
}
