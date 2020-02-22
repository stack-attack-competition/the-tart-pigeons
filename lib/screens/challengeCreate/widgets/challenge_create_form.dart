import 'package:flutter/material.dart';
import 'package:the_tart_pigeons/models/challenge_create.dart';
import 'package:the_tart_pigeons/strings.dart';

class ChallengeCreateForm extends StatefulWidget {
  ChallengeCreateForm({Key key, this.onSubmit}) : super(key: key);

  final Function(ChallengeCreate challengeCreate) onSubmit;

  @override
  _ChallengeCreateFormState createState() => _ChallengeCreateFormState();
}

class _ChallengeCreateFormState extends State<ChallengeCreateForm> {
  DateTime _selectedDate;
  ChallengeCreate _challengeCreate = ChallengeCreate();

  final _formKey = GlobalKey<FormState>();

  setDate(date) {
    setState(() {
      _selectedDate = date;
    });
  }

  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Title'),
              maxLines: 1,
              validator: (val) {
                if (val.isEmpty) return 'This field is required';
                return null;
              },
              onSaved: (val) => setState(() => _challengeCreate.title = val),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              validator: (val) {
                if (val.isEmpty) return 'This field is required';
                return null;
              },
              onSaved: (val) =>
                  setState(() => _challengeCreate.description = val),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'End date:',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                _selectedDate != null
                    // Note: We need a dependency for date formatting
                    ? '${_selectedDate.toString()}'
                    : 'No end date has been picked yet.',
                style: TextStyle(fontSize: 15.0, color: Colors.grey)),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
                onPressed: () {
                  final initialDate = DateTime.now();

                  showDatePicker(
                          context: context,
                          initialDate: initialDate,
                          firstDate: initialDate,
                          lastDate: DateTime(2022))
                      .then((date) {
                    setDate(date);
                    setState(() => _challengeCreate.endDate = date.toString());
                  });
                },
                child: Text('Pick an end date')),
            // TODO: End date needs some kind of validation
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text(Strings.wait)));
                  this._formKey.currentState.save();

                  widget.onSubmit(_challengeCreate);
                }
              },
              child: Text('Submit'),
              color: Colors.green,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
