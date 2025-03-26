import 'package:http/http.dart';


class NetworkCaller {
  final int statusCode;
  final Map<String, dynamic> responseData;
  final bool isSuccess;
  final String errorMessage;

  NetworkCaller({required this.statusCode, required this.responseData, required this.isSuccess, required this.errorMessage,});
}