
import 'package:flutter/material.dart';

class ChallengeCard extends StatefulWidget {
  ChallengeCard({ Key key, this.title, this.description, this.avatarUrl, this.onCardTap });

  final String title;
  final String description;
  final String avatarUrl;
  final Function onCardTap;

  @override
  _ChallengeCardState createState() => _ChallengeCardState();
}

class _ChallengeCardState extends State<ChallengeCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onCardTap,
      child: Card(
        margin: EdgeInsets.only(left: 15, top: 8, right: 15, bottom: 8),
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.only(left: 15, top: 8, right: 15, bottom: 8),
          child: Wrap(
            alignment: WrapAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: widget.avatarUrl != null
                  ? Image.network(widget.avatarUrl)
                  : Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSRx39zEMRIlVa_pIDgVlxUSVkzGvcerGhn5sJ2BBCYWiAY4HU8',
                    width: 50,
                    height: 50,
                    cacheWidth: 150,
                    cacheHeight: 150,
                  ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                  ),
                  Text(widget.description, overflow: TextOverflow.ellipsis,)
                ]
              )
            ],
          )
        )
      )
    );
  }
}
