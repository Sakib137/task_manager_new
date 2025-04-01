import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NetworkResponse {
  final int statusCode;
  final Map<String, dynamic>? responseData;
  final bool isSuccess;
  final String errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.responseData,
    this.errorMessage = "Something went wrong",
  });
}

class NetworkCaller {
  static Future<NetworkResponse> getRequest({
    required String url,
    Map<String, dynamic>? params,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await get(uri);

      debugPrint("URl => $url");
      debugPrint("Response Code => ${response.statusCode}");
      debugPrint("Response data => ${response.body}");

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          responseData: decodedResponse,
          statusCode: response.statusCode,
        );
      } else {
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await post(
        uri,
        headers: {'content-type': 'application/json'},
        body: jsonEncode(body),
      );

      debugPrint("URl => $url");
      debugPrint("Body => $body");
      debugPrint("Response Code => ${response.statusCode}");
      debugPrint("Response data => ${response.body}");

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          responseData: decodedResponse,
          statusCode: response.statusCode,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }
}
