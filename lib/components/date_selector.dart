import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

typedef DateTime OnDateChanged(DateTime dateTime);

//TODO: CANNOT GO BACK FROM CURRENT DATE
class DateSelector extends StatefulWidget {

  final OnDateChanged onDateChanged;
  DateTime _selectedDate;

  DateSelector({this.onDateChanged, DateTime initialDate}) {
    if(initialDate == null){
      _selectedDate = DateTime.now();
    } else {
      _selectedDate = initialDate;
    }
  }

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          onPressed: () {
            widget._selectedDate = widget._selectedDate.add(Duration(days: -1));
            setState(() {});
          },
          icon: Icon(
            FontAwesome.chevron_left,
            color: kGoodLightGray,
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesome.calendar,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                ),
                child: Text(
                  DateFormat('${DateFormat.WEEKDAY}, ${DateFormat.DAY} ${DateFormat.MONTH}').format(widget._selectedDate),
                  style: TextStyle(
                    color: kGoodDarkGray3,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            widget._selectedDate = widget._selectedDate.add(Duration(days: 1));
            setState(() {});
          },
          icon: Icon(
            FontAwesome.chevron_right,
            color: kGoodDarkGray3,
          ),
        )
      ],
    );
  }
}
