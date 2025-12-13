import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:wazzaf/core/class/statues_request.dart';

class Crud {
  Future<Either<Map, StatuesRequest>> getData({required String url}) async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Left(jsonDecode(response.body));
    } else {
      return const Right(StatuesRequest.error);
    }
  }

  Future<Either<Map, StatuesRequest>> postData({
    required String url,
    required Map data,
  }) async {
    var response = await http.post(Uri.parse(url), body: data);
    if (response.statusCode == 200) {
      return Left(jsonDecode(response.body));
    } else {
      return const Right(StatuesRequest.error);
    }
  }
}
