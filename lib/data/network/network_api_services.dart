// ignore_for_file: prefer_adjacent_string_concatenation

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:pilem_app/res/app_url.dart';
import 'package:pilem_app/res/const.dart';

import '../app_exceptions.dart';
import 'base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(
            Uri.parse(url),
          )
          .timeout(
            const Duration(
              seconds: 10,
            ),
          );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      http.Response response = await http
          .post(
            Uri.parse(
              url,
            ),
            body: data,
          )
          .timeout(
            const Duration(
              seconds: 10,
            ),
          );

      if (kDebugMode) {
        print("Check hit url");
        print(url.toString());
        print(data.toString());
      }

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
          'Error accured while communicating with server' +
              'with status code' +
              response.statusCode.toString(),
        );
    }
  }
}
