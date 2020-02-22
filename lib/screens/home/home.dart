import 'package:flutter/material.dart';
import 'package:the_tart_pigeons/models/user.dart';
import 'package:the_tart_pigeons/screens/bets/bets.dart';
import 'package:the_tart_pigeons/screens/challenges/challenges.dart';
import 'package:the_tart_pigeons/screens/profile/profile.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, this.user}) : super(key: key);

  final String title;
  final User user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  // TODO: Might be a good idea to merge these two lists
  // into a Tuple data structure
  final List<String> _pageTitles = [
    'Challenges',
    'Bets',
    'Profile'
  ];

  final List<Widget> _childScreens = [
    ChallengesPage(showOnlySelf: false,),
    BetsPage(showOnlySelf: false,),
    ProfilePage()
  ];

  void _setPageIndex(index) {
    setState(() {
      _pageIndex = index;
    });
  }

  void _showLogoutConfirm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to sign out?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                // TODO: Implement logout here
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageTitles[_pageIndex]),
        actions: <Widget>[
          IconButton(
            onPressed: _showLogoutConfirm,
            icon: Icon(Icons.vpn_key, color: Color.fromARGB(255, 255, 255, 255))
          )
        ],
      ),
      body: _childScreens[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.star), title: Text('Challenges')),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), title: Text('Bets')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Sign out')),
        ],
        onTap: _setPageIndex,
      ),
    );
  }
}
