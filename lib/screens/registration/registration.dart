import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:the_tart_pigeons/models/register.dart';
import 'package:the_tart_pigeons/models/user.dart';
import 'package:the_tart_pigeons/screens/home/home.dart';
import 'package:the_tart_pigeons/screens/login/login.dart';
import 'package:the_tart_pigeons/screens/registration/widgets/registration-form/registration-form.dart';
import 'package:the_tart_pigeons/services/authentication.service.dart';
import 'package:the_tart_pigeons/strings.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key key}) : super(key: key);

  final String title = "Registration";

  @override
  RegistrationPageState createState() => RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage> {
  AuthenticationService authenticationService = new AuthenticationService();
  RegisterModel register;

  onSubmit(RegisterModel register) async {
    register = register.copyWith();
    User user = await this.authenticationService.register(register);
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
                  RegistrationForm(
                    onSubmit: this.onSubmit,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 7),
                    child: OutlineButton(
                      child: Text(Strings.alreadySignedUp.toUpperCase()),
                      textColor: Colors.blueAccent,
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
