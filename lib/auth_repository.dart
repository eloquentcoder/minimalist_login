import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'base_url.dart';
import 'exception.dart';

abstract class BaseAuth {
  Future<dynamic> doLogin(String email, String password);
}

class AuthRepository extends BaseAuth {
  final httpClient = http.Client();

  @override
  Future<dynamic> doLogin(String email, String password) async {
    // var formData = FormData.fromMap({'email': email, 'password': password});
    final uri = Uri.parse('$baseUrl/login');
    try {
      final response = await httpClient
          .post(uri, body: {'email': email, 'password': password});
      return returnResponse(response);
    } on SocketException {
      return 'No Internet Connection';
    }
  }
}

returnResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body);
      return responseJson;
    case 400:
      return BadRequestException(json.decode(response.body)['message']);
    case 401:
      return BadRequestException(json.decode(response.body)['message']);
    case 403:
      return UnauthorisedException(json.decode(response.body)['message']);
    case 500:
    default:
      return FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
