import 'package:flutter/material.dart';
import 'package:the_tart_pigeons/screens/home/home.dart';
import 'package:the_tart_pigeons/screens/registration/registration.dart';

final routes = <String, WidgetBuilder>{
  '/home': (BuildContext context) => new HomePage(),
  '/registration': (BuildContext context) => new RegistrationPage()
};
