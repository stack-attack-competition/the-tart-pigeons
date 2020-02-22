import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  Avatar({ Key key, this.sourceUrl, });

  final String sourceUrl;

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: widget.sourceUrl != null
        ? Image.network(widget.sourceUrl)
        : Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSRx39zEMRIlVa_pIDgVlxUSVkzGvcerGhn5sJ2BBCYWiAY4HU8',
          width: 50,
          height: 50,
          cacheWidth: 150,
          cacheHeight: 150,
        ),
    );
  }
}
