import 'package:get/get.dart';
import 'package:wazzaf/core/class/crud.dart';
import 'package:wazzaf/core/class/statues_request.dart';
import 'package:wazzaf/core/data/home_data.dart';
import 'package:wazzaf/core/model/category.dart';

abstract class HomeController extends GetxController {
  Future fetchData();
}

class HomeControllerImp extends HomeController {
  HomeData homeData = HomeData(crud: Crud());
  final String title = 'test';

  String address = "syria damascus";
  List<CategoryAndItemModel> categories = [];
  StatuesRequest statuesRequest = StatuesRequest.none;
  // @override
  // fetchData() async {
  //   statuesRequest = StatuesRequest.loading;

  //   update();

  //   var response = await homeData.fetchData();
  //   if (response is Map) {
  //     if (response['status'] == 'success') {
  //       for (var element in response['data']) {
  //         categories.add(CategoryAndItemModel.fromJson(element));
  //       }
  //       statuesRequest = StatuesRequest.success;
  //     }
  //   } else {
  //     statuesRequest = response;
  //   }

  //   update();
  // }

  @override
  Future<void> fetchData() async {
    statuesRequest = StatuesRequest.loading;
    update();

    final response = await homeData.fetchData();

    response.fold(
      (data) {
        if (data['status'] == 'success') {
          categories.clear();

          for (var element in data['data']) {
            categories.add(CategoryAndItemModel.fromJson(element));
          }

          statuesRequest = StatuesRequest.success;
        } else {
          statuesRequest = StatuesRequest.noData;
        }
      },
      (status) {
        statuesRequest = status;
      },
    );

    update();
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
