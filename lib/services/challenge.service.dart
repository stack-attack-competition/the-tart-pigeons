import 'dart:convert';
import 'dart:io';

import 'package:the_tart_pigeons/constants.dart';
import 'package:the_tart_pigeons/models/challenge_create.dart';
import 'package:the_tart_pigeons/models/challenge_model.dart';
import 'package:http/http.dart' as http;

class ChallengeService {
  static final ChallengeService _authenticationService =
      ChallengeService._internal();

  factory ChallengeService() {
    return _authenticationService;
  }

  ChallengeService._internal();

  Future<Challenge> create(ChallengeCreate challengeCreate) async {
    final body = jsonEncode(challengeCreate.toMap());
    final response = await http.post("$apiBaseUrl/challenges",
        headers: {'Content-type': 'application/json'}, body: body);

    if (response.statusCode != HttpStatus.created) {
      print(response.body);
      throw Exception('Unable to create challenge');
    }

    return Challenge.fromJson(jsonDecode(response.body));
  }
}
