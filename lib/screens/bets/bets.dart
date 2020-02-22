import 'package:flutter/material.dart';
import 'package:the_tart_pigeons/models/bet.dart';
import 'package:the_tart_pigeons/services/bet.service.dart';

class BetsPage extends StatefulWidget {
  BetsPage({Key key, this.title, this.showOnlySelf, this.userId})
      : super(key: key);

  final String title;
  final bool showOnlySelf;
  final String userId;

  @override
  _BetsPageState createState() => _BetsPageState(userId: this.userId);
}

class _BetsPageState extends State<BetsPage> {
  _BetsPageState({this.userId}) : super();

  Future<List<Bet>> futureBetList;

  String userId;

  Future<List<Bet>> fetchChallenges() async {
    return BetService().getUserBets(this.userId);
  }

  @override
  void initState() {
    super.initState();
    futureBetList = fetchChallenges();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder<List<Bet>>(
              future: futureBetList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data.length > 0
                      ? AnimatedList(
                          initialItemCount: snapshot.data.length,
                          padding: EdgeInsets.only(top: 10, bottom: 65),
                          itemBuilder: (context, index, animation) {
                            final bet = snapshot.data[index];

                            return Text(bet.id);
                          })
                      : Text('No bets were found');
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else {
                  return CircularProgressIndicator();
                }
              })),
    );
  }
}
