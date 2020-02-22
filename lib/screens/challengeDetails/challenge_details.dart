import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:the_tart_pigeons/constants.dart';
import 'package:the_tart_pigeons/model/challenge_model.dart';
import 'package:the_tart_pigeons/models/user.dart';
import 'package:the_tart_pigeons/widgets/userAvatar/user_avatar.dart';

class ChallengeDetailsPage extends StatefulWidget {
  ChallengeDetailsPage({Key key, @required this.challenge}) : super(key: key);

  final Challenge challenge;

  @override
  _ChallengeDetailsPageState createState() => _ChallengeDetailsPageState();
}

class _ChallengeDetailsPageState extends State<ChallengeDetailsPage> {
  Future<User> futureUser;

  Future<User> fetchUser() async {
    final response =
        await http.get('$apiBaseUrl/users/${widget.challenge.author}');

    if (response.statusCode == 200) {
      return User.fromJsonData(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch user data');
    }
  }

  void PlaceBet(String betId) {
    //TODO: Place bet
  }

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text(widget.challenge.title)),
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth * 0.8,
          padding: EdgeInsets.only(
            top: 30,
            bottom: 15,
            left: 0,
            right: 0,
          ),
          margin: EdgeInsets.only(
              left: screenWidth * 0.1, right: screenWidth * 0.1),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              FutureBuilder(
                future: futureUser,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final User user = snapshot.data;

                    return UserAvatar(
                      fullName: '${user.firstName} ${user.lastName}',
                      sourceUrl: user.pictureUrl,
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 10.0,
                    // spacing: 15.0,
                    children: <Widget>[
                      Text(
                        widget.challenge.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.challenge.description,
                        textAlign: TextAlign.center,
                      ),
                      FlatButton(
                        onPressed: () => this.PlaceBet(widget.challenge.id),
                        child: Text('Bet'),
                        color: Colors.green,
                        textColor: Colors.white,
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
