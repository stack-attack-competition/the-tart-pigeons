import 'package:flutter/material.dart';

enum AvatarSize { small, large }

class Avatar extends StatefulWidget {
  Avatar({Key key, this.sourceUrl, @required this.size});

  final String sourceUrl;
  final AvatarSize size;

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(widget.size == AvatarSize.small ? 25.0 : 62.0),
      child: widget.sourceUrl != null
          ? Image.network(widget.sourceUrl)
          : Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSRx39zEMRIlVa_pIDgVlxUSVkzGvcerGhn5sJ2BBCYWiAY4HU8',
              width: widget.size == AvatarSize.small ? 50 : 124,
              height: widget.size == AvatarSize.small ? 50 : 124,
              cacheWidth: 200,
              cacheHeight: 200,
            ),
    );
  }
}
