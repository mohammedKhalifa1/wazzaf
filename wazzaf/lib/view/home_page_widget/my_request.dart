import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzaf/controller/my_request_controller.dart';

class MyRequestPage extends StatelessWidget {
  const MyRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final con = Get.find<MyRequestControllerImp>();
    return Column(children: [Text(con.title)]);
  }
}
