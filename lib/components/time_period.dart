
import 'package:flutter/material.dart';

import '../constants.dart';

class TimePeriodCard extends StatefulWidget {
  TimePeriodCard({
    @required this.timePeriodIcon,
    @required this.timePeriodName,
    @required this.selectedOption,
    @required this.optionIndex,
    this.onTap,
  });

  final IconData timePeriodIcon;
  final String timePeriodName;
  final int optionIndex;
  final Function onTap;
  int selectedOption;

  @override
  _TimePeriodCardState createState() => _TimePeriodCardState();
}

class _TimePeriodCardState extends State<TimePeriodCard> {
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
          padding: EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              Icon(
                widget.timePeriodIcon,
                color: (widget.optionIndex == widget.selectedOption)
                    ? Colors.white
                    : kGoodPurple,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.timePeriodName,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: (widget.optionIndex == widget.selectedOption)
                      ? Colors.white
                      : Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
