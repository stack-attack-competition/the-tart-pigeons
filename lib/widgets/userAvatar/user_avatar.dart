import 'package:flutter/material.dart';
import 'package:the_tart_pigeons/widgets/avatar/avatar.dart';

class UserAvatar extends StatefulWidget {
  UserAvatar({Key key, this.sourceUrl, @required this.fullName});

  final String sourceUrl;
  final String fullName;

  @override
  _UserAvatarState createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10.0,
        children: [
          Avatar(
            size: AvatarSize.large,
            sourceUrl: widget.sourceUrl,
          ),
          Text(widget.fullName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))
        ]);
  }
}
