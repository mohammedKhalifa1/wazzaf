import 'package:get/get.dart';
import 'package:wazzaf/core/binding/home_binding.dart';
import 'package:wazzaf/core/class/page_name.dart';
import 'package:wazzaf/view/home_page.dart';
// import 'package:wazzaf/view/home_page_widget/home.dart';
// import 'package:wazzaf/view/home_page_widget/my_request.dart';
// import 'package:wazzaf/view/home_page_widget/wazzaf.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: PageName.myHome,
    page: () => const MyHomePage(),
    binding: HomeBinding(),
  ),

  //=======
  // GetPage(name: PageName.home, page: () => const HomePage()),
  // GetPage(name: PageName.wazzaf, page: () => const Wazzaf()),
  // GetPage(name: PageName.myRequest, page: () => const MyRequestPage()),
  // GetPage(name: PageName.message, page: () => const MyRequestPage()),
];
