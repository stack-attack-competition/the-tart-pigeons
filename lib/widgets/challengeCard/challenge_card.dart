
import 'package:flutter/material.dart';
import 'package:the_tart_pigeons/widgets/avatar/avatar.dart';

class ChallengeCard extends StatefulWidget {
  ChallengeCard({
    Key key,
    this.title,
    this.description,
    this.avatarUrl,
    this.onCardTap,
    this.isActive,
    this.isOutcomePositive,
  });

  final String title;
  final String description;
  final String avatarUrl;
  final Function onCardTap;
  final bool isActive;
  final bool isOutcomePositive;

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
              Wrap(
                children: [
                  Avatar(sourceUrl: widget.avatarUrl, size: AvatarSize.small),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 33, 33, 33)
                        ),
                      ),
                      Text(
                        widget.description,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(180, 33, 33, 33)
                        )
                      ),
                      Wrap(
                        alignment: WrapAlignment.start,
                        direction: Axis.horizontal,
                        spacing: 8.0,
                        children: [
                          widget.isActive != null
                              ? Chip(
                                label: Text(
                                  widget.isActive != null && widget.isActive
                                    ? 'Active'
                                    : 'Inactive',
                                ),
                                backgroundColor: widget.isActive
                                  ? Colors.blueGrey.withAlpha(75)
                                  : Colors.red.withAlpha(200)
                              )
                            : null,
                          widget.isOutcomePositive != null
                            ? Chip(
                              label: Text(
                                widget.isOutcomePositive
                                  ? 'Completed'
                                  : 'Unsuccessful',
                                style: TextStyle(color: Colors.white)
                              ),
                              backgroundColor: widget.isOutcomePositive
                                ? Colors.green.withAlpha(250)
                                : Colors.red.withAlpha(200),
                            )
                            : null,
                        ].where((o) => o != null).toList()
                      )
                    ]
                  )
                ]
              ),
            ],
          )
        )
      )
    );
  }
}
