import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:the_tart_pigeons/constants.dart';
import 'package:the_tart_pigeons/models/register.dart';
import 'package:the_tart_pigeons/models/user.dart';

class AuthenticationService {
  static final AuthenticationService _authenticationService =
      AuthenticationService._internal();

  factory AuthenticationService() {
    return _authenticationService;
  }

  AuthenticationService._internal();

  Future<User> register(Register register) async {
    var body = json.encode(register.toMap());

    return http
        .post("$apiBaseUrl/auth/register",
            headers: {'Content-type': 'application/json'}, body: body)
        .then((http.Response response) {
      if (!kReleaseMode) {
        print(response.body);
      }
      return User.fromJson(response.body);
    });
  }
}
