import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:the_tart_pigeons/constants.dart';
import 'package:the_tart_pigeons/models/login.dart';
import 'package:the_tart_pigeons/models/user.dart';
import 'package:the_tart_pigeons/screens/home/home.dart';
import 'package:the_tart_pigeons/screens/login/widgets/login-form.dart';
import 'package:the_tart_pigeons/screens/registration/registration.dart';
import 'package:the_tart_pigeons/services/authentication.service.dart';
import 'package:the_tart_pigeons/strings.dart';

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

    try {
      User user = await this.authenticationService.login(login);

      final storage = new FlutterSecureStorage();
      storage.write(key: STORAGE_KEY_USER_ID, value: user.id);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(title: "Home Page", user: user)),
      );
    } catch (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Cannot login'),
              content: Text(error.message),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
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
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 7),
                    child: OutlineButton(
                      child: Text(Strings.notRegisteredYet.toUpperCase()),
                      textColor: Colors.blueAccent,
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationPage()),
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
