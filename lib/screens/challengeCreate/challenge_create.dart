import 'package:flutter/material.dart';
import 'package:the_tart_pigeons/models/challenge_create.dart';
import 'package:the_tart_pigeons/screens/challengeCreate/widgets/challenge_create_form.dart';
import 'package:the_tart_pigeons/services/challenge.service.dart';

class ChallengeCreatePage extends StatefulWidget {
  ChallengeCreatePage({Key key, this.userId}) : super(key: key);

  final String userId;

  @override
  _ChallengeCreatePageState createState() => _ChallengeCreatePageState();
}

class _ChallengeCreatePageState extends State<ChallengeCreatePage> {
  ChallengeService challengeService = ChallengeService();
  ChallengeCreate challengeCreate;

  void onSubmit(ChallengeCreate challengeCreate) async {

    challengeCreate = challengeCreate.copyWith(author: widget.userId);
    await this.challengeService.create(challengeCreate);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text('Create challenge')),
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
              ChallengeCreateForm(
                onSubmit: onSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
