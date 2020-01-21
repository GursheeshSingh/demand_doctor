import 'package:flutter/material.dart';
import '../constants.dart';

class ImageIcon extends StatelessWidget {
  const ImageIcon({
    @required this.imageUrl,
    this.height = 100.0,
    this.imagePadding = 10.0,
  });

  final String imageUrl;
  final double imagePadding;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.2, 0.6],
          colors: [
            kGoodPurpleLight2,
            kGoodPurpleLight,
          ],
        ),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(imagePadding),
        child: Image.asset(imageUrl),
      ),
    );
  }
}
