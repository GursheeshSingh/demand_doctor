import 'package:demand_doctor/components/option_card.dart';
import 'package:demand_doctor/constants.dart';
import 'package:demand_doctor/models/speciality_type.dart';
import 'package:flutter/material.dart';

class Step2 extends StatefulWidget {
  static const String step_2 = '/step_2';

  final Function onNextValid;
  final Function onNextInvalid;

  const Step2({@required this.onNextValid, @required this.onNextInvalid});

  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  ///If _selectedOption is 0, no option selected
  ///else an option is selected
  int _selectedOption = 0;

  List<SpecialityType> _options = [
    SpecialityType(name: 'General Medicine', imageUrl: 'images/ste.png'),
    SpecialityType(name: 'Women\'s Health', imageUrl: 'images/pregnancy.png'),
    SpecialityType(name: 'Heart', imageUrl: 'images/heart.png'),
    SpecialityType(name: 'Skin & Hair', imageUrl: 'images/hair.png'),
    SpecialityType(
        name: 'Kidney & Urinary Issues', imageUrl: 'images/kidney.png'),
    SpecialityType(name: 'Bone & Joints', imageUrl: 'images/joint.png'),
    SpecialityType(name: 'Child Specialist', imageUrl: 'images/newborn.png'),
    SpecialityType(name: 'Ayurveda', imageUrl: 'images/ayurveda.png'),
    SpecialityType(name: 'General Surgery', imageUrl: 'images/surgery.png'),
    SpecialityType(name: 'Sex Specialist', imageUrl: 'images/sex.png'),
    SpecialityType(name: 'Eye Specialist', imageUrl: 'images/eye.png'),
    SpecialityType(name: 'Dental Care', imageUrl: 'images/dental2.png'),
  ];

  _buildHeading() {
    return Text(
      'Select Speciality',
      style: kHeadingTextStyle,
    );
  }

  _buildOptionsGrid() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2.2,
        children: List.generate(_options.length, (index) {
          return OptionCard(
            optionIndex: index + 1,
            selectedOption: _selectedOption,
            imageUrl: _options[index].imageUrl,
            text: _options[index].name,
            onTap: () => onTaped(index + 1),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _buildHeading(),
        _buildOptionsGrid(),
      ],
    );
  }

  void onTaped(int optionNumber) {
    setState(() {
      //If already selected, then unselect
      _selectedOption = _selectedOption == optionNumber ? 0 : optionNumber;
    });

    if (_selectedOption == 0) {
      widget.onNextInvalid();
    } else {
      widget.onNextValid();
    }
  }
}
