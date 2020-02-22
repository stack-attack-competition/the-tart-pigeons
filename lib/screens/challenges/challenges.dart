import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:the_tart_pigeons/model/challenge_model.dart';
import 'dart:convert';

import 'package:the_tart_pigeons/widgets/challengeCard/challenge_card.dart';

class ChallengesPage extends StatefulWidget {
  ChallengesPage({Key key, this.title, this.showOnlySelf}) : super(key: key);

  final String title;
  final bool showOnlySelf;

  @override
  _ChallengesPageState createState() => _ChallengesPageState();
}

class _ChallengesPageState extends State<ChallengesPage> {
  Future<List<Challenge>> futureChallengeList;

  // TODO: Create a common reference for this API URL
  Future<List<Challenge>> fetchChallenges() async {
    final response = await http.get(
      'http://localhost:3000/challenges'
    );

    if (response.statusCode == 200) {
      final challenges = jsonDecode(response.body)
        .cast<Map<String, dynamic>>();

      return challenges
        .map<Challenge>((json) => Challenge.fromJson(json))
        .toList();
    } else {
      throw Exception('Failed to fetch challenges');
    }
  }

  @override
  void initState() {
    super.initState();
    futureChallengeList = fetchChallenges();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: FutureBuilder<List<Challenge>>(
          future: futureChallengeList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data.length > 0
                ? AnimatedList(
                  initialItemCount: snapshot.data.length,
                  padding: EdgeInsets.only(top: 10, bottom: 65),
                  itemBuilder: (context, index, animation) {
                    final challenge = snapshot.data[index];

                    return ChallengeCard(
                      title: challenge.title,
                      description: challenge.description,
                      isActive: challenge.isActive,
                      isOutcomePositive: challenge.outcome,
                      onCardTap: () {
                        print('${challenge.title} was clicked');
                      },
                    );
                  }
                )
                : Text('No challenges were found');
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return CircularProgressIndicator();
            }
          }
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Create new challenge',
        child: Icon(Icons.add),
      ),
    );
  }
}
