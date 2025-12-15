import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzaf/core/class/class_for_val/map_pages.dart';
import 'package:wazzaf/view/home_page_widget/my_request.dart';

abstract class MyRequestController extends GetxController {
  changeSelected(int index);
}

class MyRequestControllerImp extends MyRequestController {
  String title = 'test my request';
  int isSelected = 0;
  List<MapPage> myRequestPage = [
    MapPage(
      title: 'طلباتي الحالية',
      icon: Icons.remove_from_queue_sharp,
      widget: CurrentRequest(),
    ),
    MapPage(
      title: "طلباتي السابقة",
      icon: Icons.remove_from_queue_sharp,
      widget: PreviousRequest(),
    ),
  ];

  @override
  changeSelected(int index) {
    isSelected = index;
    update();
  }
}
