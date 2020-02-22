import 'package:flutter/material.dart';
import 'package:the_tart_pigeons/screens/bets/bets.dart';
import 'package:the_tart_pigeons/screens/challenges/challenges.dart';
import 'package:the_tart_pigeons/screens/home/home.dart';

final routes = <String, WidgetBuilder>{
  '/home': (BuildContext context) => new HomePage(),
  '/my-challenges': (BuildContext context) => new ChallengesPage(showOnlySelf: true,),
  '/my-bets': (BuildContext context) => new BetsPage(showOnlySelf: true,),
};
