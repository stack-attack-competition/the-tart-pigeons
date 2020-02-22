import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:the_tart_pigeons/models/login.dart';
import 'package:the_tart_pigeons/models/user.dart';
import 'package:the_tart_pigeons/screens/home/home.dart';
import 'package:the_tart_pigeons/screens/login/widgets/login-form.dart';
import 'package:the_tart_pigeons/services/authentication.service.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  final String title = "Login";

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  AuthenticationService authenticationService = new AuthenticationService();
  LoginModel login;

  onSubmit(LoginModel login) async {
    login = login.copyWith();
    User user = await this.authenticationService.login(login);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => HomePage(title: "Home Page", user: user)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  LoginForm(
                    onSubmit: this.onSubmit,
                  )
                ],
              ))),
    );
  }
}
