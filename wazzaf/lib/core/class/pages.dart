import 'package:get/get.dart';
import 'package:wazzaf/core/binding/home_binding.dart';
import 'package:wazzaf/core/class/page_name.dart';
import 'package:wazzaf/view/home_page.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: PageName.myHome,
    page: () => const MyHomePage(),
    binding: HomeBinding(),
  ),
];
