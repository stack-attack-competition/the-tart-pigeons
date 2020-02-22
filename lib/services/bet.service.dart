import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_tart_pigeons/constants.dart';
import 'package:the_tart_pigeons/models/bet.dart';

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

        return bets.map<Bet>((json) => Bet.fromJson(json)).toList();
      } else {
        print(response.body);
        throw Exception('Failed to fetch bets');
      }
    });
  }
}
