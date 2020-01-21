import 'package:flutter/material.dart';

import '../constants.dart';
import 'bordered_circular_image.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    @required this.imageUrl,
    @required this.name,
    this.positionExperience,
    this.address,
  });

  final String imageUrl;
  final String name;
  final String positionExperience;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        BorderedCircularImage(
          imageUrl:
          imageUrl,
          borderColor: kGoodPurple,
        ),
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  positionExperience,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  address,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: kGoodDarkGray,
                  ),
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 8),
          ),
        ),
        Text(
          '1.0 km',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: kGoodDarkGray,
          ),
        )
      ],
    );
  }
}
