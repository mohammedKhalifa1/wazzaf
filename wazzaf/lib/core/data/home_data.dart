import 'package:wazzaf/core/class/app_link.dart';
import 'package:wazzaf/core/class/crud.dart';

class HomeData {
  Crud crud;
  HomeData({required this.crud});

  fetchData() async {
    var response = await crud.getData(url: AppLink.home);

    return response.fold((l) => l, (r) => r);
  }
}
