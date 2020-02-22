import 'package:flutter/material.dart';
import 'package:the_tart_pigeons/screens/bets/bets.dart';
import 'package:the_tart_pigeons/screens/challenges/challenges.dart';
import 'package:the_tart_pigeons/screens/home/home.dart';
import 'package:the_tart_pigeons/screens/login/login.dart';
import 'package:the_tart_pigeons/screens/registration/registration.dart';

final routes = <String, WidgetBuilder>{
  '/home': (BuildContext context) => new HomePage(),
  '/registration': (BuildContext context) => new RegistrationPage(),
  '/login': (BuildContext context) => new LoginPage(),
  '/my-challenges': (BuildContext context) => new ChallengesPage(showOnlySelf: true,),
  '/my-bets': (BuildContext context) => new BetsPage(showOnlySelf: true,),
};
