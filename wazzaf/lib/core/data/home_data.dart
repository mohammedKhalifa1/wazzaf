import 'package:dartz/dartz.dart';
import 'package:wazzaf/core/class/app_link.dart';
import 'package:wazzaf/core/class/crud.dart';
import 'package:wazzaf/core/class/statues_request.dart';

class HomeData {
  Crud crud;
  HomeData({required this.crud});

  Future<Either<Map, StatuesRequest>> fetchData() async {
    return await crud.getData(url: AppLink.home);
  }
}
