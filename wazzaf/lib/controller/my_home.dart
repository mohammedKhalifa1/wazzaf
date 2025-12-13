import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzaf/core/class/class_for_val/map_pages.dart';
import 'package:wazzaf/view/home_page_widget/add_request.dart';
import 'package:wazzaf/view/home_page_widget/home.dart';
import 'package:wazzaf/view/home_page_widget/messages.dart';
import 'package:wazzaf/view/home_page_widget/my_request.dart';
import 'package:wazzaf/view/home_page_widget/wazzaf.dart';

abstract class HomePageAbstract extends GetxController {
  void changePage(int index);
}

class HomePageController extends HomePageAbstract {
  int isSelected = 0;
  List<MapPage> pages = [
    MapPage(title: 'الرئيسية', icon: Icons.home_filled, widget: HomePage()),
    MapPage(
      title: 'طلباتي',
      icon: Icons.free_cancellation_rounded,

      widget: MyRequestPage(),
    ),
    MapPage(
      widget: AddRequestPage(),
      title: 'اضافة طلب',
      icon: Icons.add_circle_sharp,
    ),
    MapPage(widget: MessagesPage(), title: 'الرسائل', icon: Icons.message),
    MapPage(widget: Wazzaf(), title: 'wazzaf', icon: Icons.home_filled),
  ];

  @override
  void changePage(int index) {
    isSelected = index;
    update();
  }
}
