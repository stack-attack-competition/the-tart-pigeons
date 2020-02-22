import 'package:flutter/material.dart';
import 'package:the_tart_pigeons/model/challenge_model.dart';
import 'package:the_tart_pigeons/models/new-bet.dart';
import 'package:the_tart_pigeons/services/bet.service.dart';
import 'package:the_tart_pigeons/strings.dart';

class PlaceBetPage extends StatefulWidget {
  PlaceBetPage({Key key, this.challenge, this.userId}) : super(key: key);

  final Challenge challenge;
  final String userId;

  @override
  _PlaceBetPageState createState() => _PlaceBetPageState();
}

class _PlaceBetPageState extends State<PlaceBetPage> {
  bool inFavor = false;
  int amount = 0;
  int result = 0;

  onPlaceBet() async {
    var newBet = NewBet(
        inFavor: inFavor,
        amount: amount,
        result: result,
        challenge: widget.challenge.id,
        author: widget.userId);

    await BetService().postBet(newBet);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Place bet on ${widget.challenge.title}")),
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                child: Text(
                  "Challenge:",
                  style: Theme.of(context).textTheme.headline,
                ),
                padding: EdgeInsets.only(top: 15, right: 15),
              ),
              Padding(
                child: Text(
                  widget.challenge.title,
                  style: Theme.of(context).textTheme.headline,
                ),
                padding: EdgeInsets.only(top: 15, right: 15),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                child: OutlineButton(
                  onPressed: () => inFavor = true,
                  child: Icon(
                    Icons.thumb_up,
                    color: Colors.amberAccent,
                    size: 54.0,
                  ),
                ),
                padding: EdgeInsets.only(top: 15, right: 15),
              ),
              Padding(
                  child: OutlineButton(
                    onPressed: () => inFavor = false,
                    child: Icon(
                      Icons.thumb_down,
                      color: Colors.amberAccent,
                      size: 54.0,
                    ),
                  ),
                  padding: EdgeInsets.only(top: 15, right: 15))
            ],
          ),
          Container(
            padding: EdgeInsets.all(45),
            child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (val) => amount = int.parse(val),
              decoration: InputDecoration(labelText: "Amount", hintText: "USD"),
              validator: (value) {
                if (value.isEmpty) {
                  return Strings.requiredFieldError;
                }
                return null;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(45),
                child: FlatButton(
                    onPressed: onPlaceBet,
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Text("Bet")),
              ),
              Container(
                  padding: EdgeInsets.all(45),
                  child: FlatButton(
                      onPressed: () => Navigator.pop(context),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      child: Text("Cancel")))
            ],
          )
        ],
      ),
    );
  }
}
