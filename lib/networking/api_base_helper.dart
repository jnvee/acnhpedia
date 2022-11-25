import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_exceptions.dart';
import 'dart:async';

class ApiBaseHelper {
  final String _baseURL = "https://api.nookipedia.com/";

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Future<dynamic> get(String url) async {
    print('Api get url $url');
    var responseJson;
    try {
      final response = await http.get(Uri.parse(_baseURL + url));
      responseJson = _returnResponse(response);
    } on SocketException {
      print('no net');
      throw FetchDataException('No Internet Connection');
    }
    print('api get received');
    return responseJson;
  }
}
