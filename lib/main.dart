import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_tart_pigeons/screens/home/home.dart';

import 'routes.dart';

void main() => runApp(new MaterialApp(
      title: 'Flutter Demo',
      routes: routes,
      home: HomePage(title: 'Flutter Demo Home Page'),
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
