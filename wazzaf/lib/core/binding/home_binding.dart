import 'package:get/get.dart';
import 'package:wazzaf/controller/home_page.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}
