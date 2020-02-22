import 'package:flutter/material.dart';

class BetsPage extends StatefulWidget {
  BetsPage({Key key, this.title, this.showOnlySelf}) : super(key: key);

  final String title;
  final bool showOnlySelf;

  @override
  _BetsPageState createState() => _BetsPageState();
}

class _BetsPageState extends State<BetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.showOnlySelf
                ? 'Self bets appear here'
                : 'All bets appear here'
            )
          ],
        ),
      ),
    );
  }
}
