import 'package:demand_doctor/components/image_icon.dart' as imageIcon;
import 'package:demand_doctor/components/option_card.dart';
import 'package:demand_doctor/models/appointment_for.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Step1 extends StatefulWidget {
  static const String step_1 = '/step_1';

  final Function onNextValid;
  final Function onNextInvalid;

  const Step1({@required this.onNextValid, @required this.onNextInvalid});

  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {

  ///If _selectedOption is 0, no option selected
  ///else an option is selected
  int _selectedOption = 0;

  List<AppointmentFor> _appointmentFor = [
    AppointmentFor(type: 'Myself', imageUrl: 'images/myself.png'),
    AppointmentFor(type: 'My Wife', imageUrl: 'images/wife.png'),
    AppointmentFor(type: 'Children', imageUrl: 'images/child.png'),
    AppointmentFor(type: 'Other', imageUrl: 'images/grandparents2.png'),
  ];

  _buildHeading() {
    return Text(
      'Appointment for?',
      style: kHeadingTextStyle,
    );
  }

  _buildChildren() {

    var widgets = <Widget>[
      _buildHeading(),
    ];

    //Adding option cards
    widgets.addAll(List.generate(_appointmentFor.length, (index) {
      return OptionCard(
        optionIndex: index + 1,
        selectedOption: _selectedOption,
        imageUrl: _appointmentFor[index].imageUrl,
        text: _appointmentFor[index].type,
        onTap: () => onTaped(index + 1),
      );
    }));

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: _buildChildren(),
    );
  }

  void onTaped(int optionNumber) {
    setState(() {
      //If already selected, then unselect
      _selectedOption = _selectedOption == optionNumber ? 0 : optionNumber;
    });

    if (_selectedOption == 0) {
      //No Option is selected
      widget.onNextInvalid();
    } else {
      //Option selected
      widget.onNextValid();
    }
  }
}
