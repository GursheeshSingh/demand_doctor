import 'package:demand_doctor/screens/calender_page.dart';
import 'package:demand_doctor/screens/home_menu.dart';
import 'package:demand_doctor/screens/profile_page.dart';
import 'package:demand_doctor/screens/booking_appointment.dart';
import 'package:demand_doctor/screens/steps/step_1.dart';
import 'package:demand_doctor/screens/steps/step_2.dart';
import 'package:demand_doctor/screens/steps/step_3.dart';
import 'package:demand_doctor/screens/steps/step_4.dart';
import 'package:demand_doctor/screens/steps/step_5.dart';
import 'package:flutter/material.dart';

class StepNavigator extends StatelessWidget {
  StepNavigator({
    @required this.navigatorKey,
    @required this.onNextValid,
    @required this.onNextInvalid,
    this.goForward,
    this.goBack,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final Function onNextValid;
  final Function onNextInvalid;
  final Function goForward;
  final Function goBack;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      '/': (context) => Step1(
            onNextInvalid: onNextInvalid,
            onNextValid: onNextValid,
          ),
      Step2.step_2: (context) => Step2(
            onNextInvalid: onNextInvalid,
            onNextValid: onNextValid,
          ),
      Step3.step_3: (context) => Step3(goForward),
      Step4.step_4: (context) => Step4(
            onNextValid: onNextValid,
            onNextInvalid: onNextInvalid,
          ),
      Step5.step_5: (context) => Step5(),
    };
  }

  @override
  Widget build(BuildContext context) {
    //Creating all possible routes
    var routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (routeSettings) {
        //Going to route based on name passed
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
