import 'package:get/get.dart';
import 'package:wazzaf/controller/add_request_controller.dart';
import 'package:wazzaf/controller/home_controller.dart';
import 'package:wazzaf/controller/message_controller.dart';
import 'package:wazzaf/controller/my_home.dart';
import 'package:wazzaf/controller/my_request_controller.dart';
import 'package:wazzaf/controller/wazzaf_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());

    Get.lazyPut(() => HomeControllerImp());
    Get.lazyPut(() => MyRequestControllerImp());
    Get.lazyPut(() => AddRequestControllerImp());
    Get.lazyPut(() => MessageControllerImp());
    Get.lazyPut(() => WazzafControllerImp());
  }
}
