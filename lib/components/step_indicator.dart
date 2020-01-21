import 'package:flutter/material.dart';

import '../constants.dart';

class StepIndicator extends StatefulWidget {
  final int stepIndex;
  int currentIndex;

  StepIndicator({this.stepIndex, this.currentIndex});

  @override
  _StepIndicatorState createState() => _StepIndicatorState();
}

class _StepIndicatorState extends State<StepIndicator> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: (widget.stepIndex <= widget.currentIndex)
              ? kGoodPurple
              : kGoodMidGray,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 10,
      ),
    );
  }
}
