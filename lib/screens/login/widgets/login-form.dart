import 'package:flutter/material.dart';
import 'package:the_tart_pigeons/models/login.dart';
import 'package:the_tart_pigeons/strings.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key, this.onSubmit}) : super(key: key);

  final Function(LoginModel login) onSubmit;

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _login = LoginModel();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Builder(
      builder: (context) => Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) {
                    return Strings.requiredFieldError;
                  }
                  return null;
                },
                onSaved: (val) => setState(() => _login.email = val)),
            TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (val) {
                  if (val.isEmpty) return Strings.requiredFieldError;
                  return null;
                },
                onSaved: (val) => setState(() => _login.password = val)),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  child: Text(Strings.login.toUpperCase()),
                  color: Colors.deepOrangeAccent,
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text(Strings.wait)));
                      this._formKey.currentState.save();
                      widget.onSubmit(this._login);
                    }
                  },
                ),
              ),
            )
          ])),
    );
  }
}
