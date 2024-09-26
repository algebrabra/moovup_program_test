//Common Service for request RESTful API

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'BaseAPIModel.dart';
import 'package:http/http.dart' as http;
import 'package:moovup_program_test/Common/Config/Environment.dart';

class APIService {

  static APIService shared = APIService();

  http.Client client = http.Client();

  Future<dynamic> fetchAPI({required String url, required RequestMethod requestMethod, BaseAPIModel? apiModel}) async {
    String domain = Environment.getHost();
    String token = Environment.getApiKey();
    String? jsonString = jsonEncode(apiModel?.toJson());
    late final http.Response response;
    switch (requestMethod) {
      case RequestMethod.get:
        response = await client
            .get(Uri.parse('$domain$url'),
        headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: "application/json",
        });
        break;
      case RequestMethod.post:
        response = await client
            .post(Uri.parse('$domain$url'),
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
            HttpHeaders.contentTypeHeader: "application/json",
          },
          body: jsonString,
        );
        break;
      case RequestMethod.put:
        response = await client
            .put(Uri.parse('$domain$url'),
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
            HttpHeaders.contentTypeHeader: "application/json",
          },
          body: jsonString,
        );
        break;
      case RequestMethod.delete:
        response = await client
            .delete(Uri.parse('$domain$url'),
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
            HttpHeaders.contentTypeHeader: "application/json",
          },
          body: jsonString,
        );
        break;
    }
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      Map<String, dynamic> json = Map<String, dynamic>();
      json['error_code'] = response.statusCode;
      try {
        Map<String, dynamic> error = jsonDecode(
            utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
        json['error_message'] = error['error'] as String;
      } on FormatException catch (e) {
        json['error_message'] = utf8.decode(response.bodyBytes);
      }
      return json;
    }
  }
}

enum RequestMethod {
  get, post, put, delete
}