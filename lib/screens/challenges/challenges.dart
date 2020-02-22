import 'package:flutter/material.dart';

class ChallengesPage extends StatefulWidget {
  ChallengesPage({Key key, this.title, this.showOnlySelf}) : super(key: key);

  final String title;
  final bool showOnlySelf;

  @override
  _ChallengesPageState createState() => _ChallengesPageState();
}

class _ChallengesPageState extends State<ChallengesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.showOnlySelf
                ? 'Self challenges appear here'
                : 'All challenges appear here'
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Create new challenge',
        child: Icon(Icons.add),
      ),
    );
  }
}
