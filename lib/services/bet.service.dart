import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:the_tart_pigeons/constants.dart';
import 'package:the_tart_pigeons/models/bet.dart';
import 'package:the_tart_pigeons/models/new-bet.dart';

class BetService {
  static final BetService _betService = BetService._internal();

  factory BetService() {
    return _betService;
  }

  BetService._internal();

  Future<List<Bet>> getUserBets(String userId) async {
    return http
        .get("$apiBaseUrl/users/$userId/bets")
        .then((http.Response response) {
      if (response.statusCode == 200) {
        final bets = jsonDecode(response.body).cast<Map<String, dynamic>>();

        return bets.map<Bet>((json) => Bet.fromMap(json)).toList();
      } else {
        print(response.body);
        throw Exception('Failed to fetch bets');
      }
    });
  }

  Future<Bet> postBet(NewBet newBet) async {
    var body = json.encode(newBet.toMap());
    return http
        .post("$apiBaseUrl/bets",
            headers: {'Content-type': 'application/json'}, body: body)
        .then((http.Response response) {
      if (!kReleaseMode) {
        print("BET RESPONSE");
        print(response.body);
      }

      if (response.statusCode == HttpStatus.unauthorized) {
        throw FlutterError("Unauthorized");
      }

      return Bet.fromJson(response.body);
    });
  }
}
