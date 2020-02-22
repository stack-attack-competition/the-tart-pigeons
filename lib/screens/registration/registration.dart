import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_tart_pigeons/models/register.dart';
import 'package:the_tart_pigeons/screens/registration/widgets/registration-form/registration-form.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key key}) : super(key: key);

  final String title = "Registration";

  @override
  RegistrationPageState createState() => RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage> {
  onSubmit(Register register) {
    print("REGISTER SUBMITTED" + register.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[RegistrationForm(onSubmit: this.onSubmit,)],
          ))),
    );
  }
}
