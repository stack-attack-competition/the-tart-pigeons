import 'package:flutter/material.dart';
import 'package:the_tart_pigeons/models/register.dart';
import 'package:the_tart_pigeons/strings.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key key, this.onSubmit}) : super(key: key);

  final Function(Register register) onSubmit;

  @override
  RegistrationFormState createState() {
    return RegistrationFormState();
  }
}

class RegistrationFormState extends State<RegistrationForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _register = Register();

  final TextEditingController _passTextEditingController =
      TextEditingController();
  final TextEditingController _confirmPassTextEditingController =
      TextEditingController();

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
                onSaved: (val) =>
                    setState(() => _register.email = val)),
            TextFormField(
                decoration: InputDecoration(labelText: "First Name"),
                validator: (value) {
                  if (value.isEmpty) {
                    return Strings.requiredFieldError;
                  }
                  return null;
                },
                onSaved: (val) =>
                    setState(() => _register.firstName = val)),
            TextFormField(
                decoration: InputDecoration(labelText: "Last Name"),
                validator: (value) {
                  if (value.isEmpty) {
                    return Strings.requiredFieldError;
                  }
                  return null;
                },
                onSaved: (val) =>
                    setState(() => _register.lastName = val)),
            TextFormField(
                controller: _passTextEditingController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (val) {
                  if (val.isEmpty) return Strings.requiredFieldError;
                  return null;
                },
                onSaved: (val) =>
                    setState(() => _register.password = val)),
            TextFormField(
                controller: _confirmPassTextEditingController,
                decoration: InputDecoration(labelText: "Password Confirm"),
                obscureText: true,
                validator: (val) {
                  if (val.isEmpty) return Strings.requiredFieldError;
                  if (val != _passTextEditingController.text)
                    return Strings.passwordNotMatch;
                  return null;
                }),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text(Strings.wait)));
                        this._formKey.currentState.save();
                        widget.onSubmit(this._register.copyWith(pictureUrl: ""));
                  }
                },
                child: Text(Strings.register),
              ),
            )
          ])),
    );
  }
}
