import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiCallMethods {
  static const String baseUrl = "";

  static checkInternet() async {
    try {
      if (kIsWeb) {
        return true;
      }
      final result = await InternetAddress.lookup("google.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      throw ApiException("Check Your Internet", "");
    } catch (e) {
      throw ApiException("Check Your Internet", "");
    }
  }

  static Future<http.Response> httpRequest() async {
    return await http.post(Uri.parse(""));
  }

  static Future<http.Response> post() async {
    await checkInternet();
    return httpRequest().timeout(const Duration(seconds: 15),
        onTimeout: () => throw TimeoutException("Connection Time Out"));
  }

  static checkResponse({required http.Response response})
  {
    if(response.statusCode.toString() == "200")
      {
        print("Success");
      }
  }
}

class ApiException implements Exception {
  final _message;
  final _prefix;

  ApiException(this._message, this._prefix);

  @override
  String toString() {
    // TODO: implement toString
    return "$_prefix $_message";
  }
}
