import 'package:demand_doctor/components/image_icon.dart' as imageIcon;
import 'package:demand_doctor/components/option_card.dart';
import 'package:demand_doctor/components/step_indicator.dart';
import 'package:demand_doctor/components/step_navigator.dart';
import 'package:demand_doctor/constants.dart';
import 'package:demand_doctor/screens/appointment_completed_screen.dart';
import 'package:demand_doctor/screens/steps/step_1.dart';
import 'package:demand_doctor/screens/steps/step_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BookingAppointmentScreen extends StatefulWidget {
  static const String booking_appointment = '/booking_appointment';

  const BookingAppointmentScreen({@required this.onBookingCompleted});

  final Function onBookingCompleted;

  @override
  _BookingAppointmentScreenState createState() =>
      _BookingAppointmentScreenState();
}

class _BookingAppointmentScreenState extends State<BookingAppointmentScreen> {
  GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  int _currentStep = 1;
  /// States if we can go to the next step
  bool _nextValid = false;
  /// States if next step button is visible
  bool _nextVisible = true;

  _buildStepIndicator() {
    return Row(
      children: <Widget>[
        StepIndicator(
          stepIndex: 1,
          currentIndex: _currentStep,
        ),
        StepIndicator(
          stepIndex: 2,
          currentIndex: _currentStep,
        ),
        StepIndicator(
          stepIndex: 3,
          currentIndex: _currentStep,
        ),
        StepIndicator(
          stepIndex: 4,
          currentIndex: _currentStep,
        ),
        StepIndicator(
          stepIndex: 5,
          currentIndex: _currentStep,
        ),
      ],
    );
  }

  _buildNextButton() {
    return Visibility(
      visible: _nextVisible,
      child: FloatingActionButton(
        backgroundColor: _nextValid ? kGoodOrange : kGoodOrange2,
        elevation: 0,
        onPressed: goForward,
        child: Icon(FontAwesome.arrow_right),
      ),
    );
  }

  _buildPreviousButton() {
    return FloatingActionButton(
      backgroundColor: kGoodOrange,
      elevation: 0,
      onPressed: goBack,
      child: Icon(FontAwesome.arrow_left),
    );
  }

  _buildBookAppointmentButton() {
    return Visibility(
      visible: _currentStep == 5,
      child: FlatButton(
        onPressed: () {
          widget.onBookingCompleted();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        color: kGoodOrange,
        child: Text(
          'Book Appointment',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildPreviousButton(),
        Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[_buildNextButton(), _buildBookAppointmentButton()],
        )
      ],
    );
  }

  _buildContent() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: StepNavigator(
          navigatorKey: navigationKey,
          onNextValid: () {
            _nextValid = true;
            //TODO: REBUILD ONLY BUTTON
            setState(() {});
          },
          onNextInvalid: () {
            //TODO: REBUILD ONLY BUTTON
            _nextValid = false;
            setState(() {});
          },
          goBack: goBack,
          goForward: goForward,
        ),
      ),
    );
  }

  void goForward() {
    //Cannot go to next step if invalid
    if (_nextValid == false) {
      return;
    }

    // Go to next step
    _currentStep += 1;

    navigationKey.currentState
        .pushNamed('/step_' + _currentStep.toString());

    if (_currentStep == 3 || _currentStep == 5) {
      //Make next button hide and can go to next step
      _nextVisible = false;
      _nextValid = true;
    } else {
      //Make next button show and make it invalid
      _nextVisible = true;
      _nextValid = false;
    }

    //TODO: Rebuild only step indicator and arrows
    setState(() {});
  }

  void goBack() {

    if (_currentStep == 1) {
      //TODO: Laggy
      Navigator.pop(context);
    } else {
      navigationKey.currentState.pop();
      //Go to previous step
      _currentStep -= 1;
      //As we can only go to next screen if was valid before
      _nextValid = true;

      if(_currentStep == 3){
        _nextVisible = false;
      } else {
        _nextVisible = true;
      }

      //TODO: Rebuild only step indicator and arrows
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 30,
        ),
        child: Column(
          children: <Widget>[
            _buildStepIndicator(),
            _buildContent(),
            _buildButtons()
          ],
        ),
      ),
    );
  }

}
