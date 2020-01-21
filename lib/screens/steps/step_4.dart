import 'package:demand_doctor/components/bordered_circular_image.dart';
import 'package:demand_doctor/components/date_selector.dart';
import 'package:demand_doctor/components/doctor_card.dart';
import 'package:demand_doctor/components/time_period.dart';
import 'package:demand_doctor/components/time_slot.dart';
import 'package:demand_doctor/models/time_period.dart';
import 'package:demand_doctor/models/time_slot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../constants.dart';

class Step4 extends StatefulWidget {
  static const String step_4 = '/step_4';

  final Function onNextValid;
  final Function onNextInvalid;

  Step4({@required this.onNextValid, @required this.onNextInvalid});

  @override
  _Step4State createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  int _selectedTimePeriod = 0;
  int _selectedTimeSlot = 0;

  List<TimePeriod> _timePeriods = [
    TimePeriod(
      name: 'Morning',
      icon: Feather.sunrise,
      timeSlots: [
        TimeSlot(slotTime: Duration(hours: 8)),
        TimeSlot(slotTime: Duration(hours: 8, minutes: 30)),
        TimeSlot(slotTime: Duration(hours: 9)),
        TimeSlot(slotTime: Duration(hours: 9, minutes: 30)),
        TimeSlot(slotTime: Duration(hours: 10)),
        TimeSlot(slotTime: Duration(hours: 10, minutes: 30)),
      ],
    ),
    TimePeriod(
      name: 'Afternoon',
      icon: MaterialIcons.wb_sunny,
      timeSlots: [
        TimeSlot(slotTime: Duration(hours: 12)),
        TimeSlot(slotTime: Duration(hours: 12, minutes: 30)),
        TimeSlot(slotTime: Duration(hours: 1)),
        TimeSlot(slotTime: Duration(hours: 1, minutes: 30)),
        TimeSlot(slotTime: Duration(hours: 2)),
        TimeSlot(slotTime: Duration(hours: 2, minutes: 30)),
      ],
    ),
    TimePeriod(
      name: 'Evening',
      icon: FontAwesome5.moon,
      timeSlots: [
        TimeSlot(slotTime: Duration(hours: 4)),
        TimeSlot(slotTime: Duration(hours: 4, minutes: 30)),
        TimeSlot(slotTime: Duration(hours: 5)),
        TimeSlot(slotTime: Duration(hours: 5, minutes: 30)),
        TimeSlot(slotTime: Duration(hours: 6)),
        TimeSlot(slotTime: Duration(hours: 6, minutes: 30)),
      ],
    ),
    TimePeriod(
      name: 'Night',
      icon: Feather.sunrise,
      timeSlots: [
        TimeSlot(slotTime: Duration(hours: 8)),
        TimeSlot(slotTime: Duration(hours: 8, minutes: 30)),
        TimeSlot(slotTime: Duration(hours: 9)),
        TimeSlot(slotTime: Duration(hours: 9, minutes: 30)),
        TimeSlot(slotTime: Duration(hours: 10)),
        TimeSlot(slotTime: Duration(hours: 10, minutes: 30)),
      ],
    ),
  ];

  //TODO: Make doctor dynamic based on selection
  _buildSelectedDoctorCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: kGoodPurple,
            width: 0.4,
            style: BorderStyle.solid,
          ),
          bottom: BorderSide(
            color: kGoodPurple,
            width: 0.4,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: DoctorCard(
        imageUrl:
            'https://stylesatlife.com/wp-content/uploads/2015/07/Hairstyles-for-Small-Faces2.jpg',
        name: 'Dr. Daisy Murphy',
        positionExperience: 'Dematogolist. 11yrs exp.',
        address: '3386 Sector 19/D CHD, 160019',
      ),
    );
  }

  _buildHeading() {
    return Text(
      'Select a time slot',
      style: kHeadingTextStyle,
    );
  }

  _buildTimePeriods() {
    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(_timePeriods.length, (index) {
          return TimePeriodCard(
            optionIndex: index + 1,
            selectedOption: _selectedTimePeriod,
            timePeriodIcon: _timePeriods[index].icon,
            timePeriodName: _timePeriods[index].name,
            onTap: () => onTimePeriodSelected(index + 1),
          );
        }),
      ),
    );
  }

  _buildTimeSlots() {
    return Visibility(
      //only show if time period is selected
      visible: _selectedTimePeriod != 0,
      child: Container(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          //get time slots based on selected time period
          itemCount: _timePeriods[
          _selectedTimePeriod - 1 == -1 ? 0 : _selectedTimePeriod - 1]
              .timeSlots
              .length,
          itemBuilder: (context, index) {
            TimeSlot timeSlot = _timePeriods[
            _selectedTimePeriod - 1 == -1 ? 0 : _selectedTimePeriod - 1]
                .timeSlots[index];
            return TimeSlotCard(
              selectedOption: _selectedTimeSlot,
              optionIndex: index + 1,
              timePeriod: timeFormatter(timeSlot.slotTime),
              onTap: () => onTimeSlotSelected(index + 1),
            );
          },
        ),
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
        SizedBox(
          height: 10,
        ),
        _buildSelectedDoctorCard(),
        SizedBox(
          height: 20,
        ),
        DateSelector(),
        SizedBox(
          height: 20,
        ),
        Text(
          'Pick Time',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        _buildTimePeriods(),
        _buildTimeSlots(),
      ],
    );
  }

  String timeFormatter(Duration duration) {
    return [duration.inHours, duration.inMinutes]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  void onTimeSlotSelected(int optionNumber) {
    setState(() {
      //Unselect if selected
      //Select if not selected
      _selectedTimeSlot = _selectedTimeSlot == optionNumber ? 0 : optionNumber;
    });

    if (_selectedTimeSlot == 0) {
      widget.onNextInvalid();
    } else {
      widget.onNextValid();
    }
  }

  void onTimePeriodSelected(int optionNumber) {
    setState(() {
      //If already selected then unselect
      _selectedTimePeriod =
          _selectedTimePeriod == optionNumber ? 0 : optionNumber;
    });


    if (_selectedTimePeriod == 0) {
      widget.onNextInvalid();
    }
  }


}
