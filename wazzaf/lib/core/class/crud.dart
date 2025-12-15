import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:wazzaf/core/class/statues_request.dart';

class Crud {
  Future<Either<Map, StatuesRequest>> getData({required String url}) async {
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data == null || data.isEmpty) {
          return const Right(StatuesRequest.noData);
        }

        return Left(data);
      } else if (response.statusCode == 401) {
        return const Right(StatuesRequest.noToken);
      } else {
        return const Right(StatuesRequest.failure);
      }
    } on SocketException {
      return const Right(StatuesRequest.noInternet);
    } on TimeoutException {
      return const Right(StatuesRequest.noInternet);
    } catch (e) {
      return const Right(StatuesRequest.error);
    }
  }

  Future<Either<Map, StatuesRequest>> postData({
    required String url,
    required Map data,
  }) async {
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData == null || responseData.isEmpty) {
          return const Right(StatuesRequest.noData);
        }

        return Left(responseData);
      } else if (response.statusCode == 401) {
        return const Right(StatuesRequest.noToken);
      } else {
        return const Right(StatuesRequest.failure);
      }
    } on SocketException {
      return const Right(StatuesRequest.noInternet);
    } on TimeoutException {
      return const Right(StatuesRequest.noInternet);
    } catch (e) {
      return const Right(StatuesRequest.error);
    }
  }
}
