import 'package:flutter/material.dart';
import '../constants.dart';

class BorderedCircularImage extends StatelessWidget {
  final String imageUrl;
  final Color borderColor;
  final double borderWidth;

  const BorderedCircularImage({
    @required this.imageUrl,
    this.borderColor = Colors.black,
    this.borderWidth = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: borderWidth,
          color: borderColor,
        ),
      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        maxRadius: 25,
        backgroundColor: Colors.white,
      ),
    );
  }
}
