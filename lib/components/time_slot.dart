import 'package:flutter/material.dart';

import '../constants.dart';

class TimeSlotCard extends StatefulWidget {
  TimeSlotCard({
    @required this.timePeriod,
    @required this.selectedOption,
    @required this.optionIndex,
    this.onTap,
  });

  final String timePeriod;
  final int optionIndex;
  final Function onTap;
  int selectedOption;

  @override
  _TimeSlotCardState createState() => _TimeSlotCardState();
}

class _TimeSlotCardState extends State<TimeSlotCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap();
        }
      },
      child: Card(
        color: (widget.optionIndex == widget.selectedOption)
            ? kGoodPurple
            : Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Center(
            child: Text(
              widget.timePeriod,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: (widget.optionIndex == widget.selectedOption)
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
