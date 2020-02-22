import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:the_tart_pigeons/constants.dart';
import 'package:the_tart_pigeons/models/user.dart';
import 'package:the_tart_pigeons/screens/home/home.dart';
import 'package:the_tart_pigeons/screens/login/login.dart';
import 'package:the_tart_pigeons/services/authentication.service.dart';

import 'routes.dart';

final storage = new FlutterSecureStorage();
final authenticationService = new AuthenticationService();

Future<User> getUser() async {
  var userId = await storage.read(key: STORAGE_KEY_USER_ID);
  return userId.isNotEmpty ? await authenticationService.getUser(userId) : null;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(new MaterialApp(
    title: 'Flutter Demo',
    routes: routes,
    home: FutureBuilder(
      future: getUser(),
      initialData: null,
      builder: (context, snapshot) {
        var user = snapshot.data;
        if (user != null) {
          return HomePage(title: "Home Page", user: user);
        } else {
          return LoginPage();
        }
      },
    ),
    theme: ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      primarySwatch: Colors.blue,
    ),
  ));
}
