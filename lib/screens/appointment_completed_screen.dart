import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constants.dart';
import 'package:device_calendar/device_calendar.dart';

class AppointmentCompletedScreen extends StatefulWidget {
  DeviceCalendarPlugin _deviceCalendarPlugin;

  AppointmentCompletedScreen() {
    _deviceCalendarPlugin = DeviceCalendarPlugin();
  }

  @override
  _AppointmentCompletedScreenState createState() =>
      _AppointmentCompletedScreenState();
}

class _AppointmentCompletedScreenState
    extends State<AppointmentCompletedScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Calendar> _calendars;
  Calendar _selectedCalendar;
  String _selectedCalendarId;

  //Retrieve user's calendars from mobile device
  //Request permissions first if they haven't been granted
  //Retrieve calendars
  void _retrieveCalendars() async {
    try {
      var permissionsGranted =
          await widget._deviceCalendarPlugin.hasPermissions();
      if (permissionsGranted.isSuccess && !permissionsGranted.data) {
        permissionsGranted =
            await widget._deviceCalendarPlugin.requestPermissions();
        if (!permissionsGranted.isSuccess || !permissionsGranted.data) {
          return;
        }
      }

      final calendarsResult =
          await widget._deviceCalendarPlugin.retrieveCalendars();

      setState(() {
        _calendars = calendarsResult?.data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    _retrieveCalendars();
  }

  _buildHeader() {
    return Container(
      margin: EdgeInsets.only(
        left: 15,
        right: 20,
      ),
      child: Text(
        'Appointment booked with Dr. Daisy Murphy',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: kGoodDarkGray3,
        ),
      ),
    );
  }

  _buildDetails() {
    return Container(
      margin: EdgeInsets.only(
        left: 15,
        right: 20,
      ),
      child: Text(
        'Mon 25 Feb - 1:00 PM',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: kGoodPurple,
        ),
      ),
    );
  }

  _showSnackbar(String message, String actionName, Function onPressed) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: actionName,
          onPressed: onPressed,
        ),
      ),
    );
  }

  _showNoActionSnackbar(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _onCalendarSelected(int index) {
    _selectedCalendar = _calendars[index];
    _selectedCalendarId = _calendars[index].id;

    Navigator.pop(context);
  }

  _buildSimpleDialog() {
    return SimpleDialog(
      title: Text('Select calender'),
      children: List.generate(_calendars.length, (index) {
        return SimpleDialogOption(
          onPressed: () => _onCalendarSelected(index),
          child: _buildDialogOption(index),
        );
      }),
    );
  }

  _buildDialogOption(int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              _calendars[index].name,
            ),
          ),
          Icon(
            _calendars[index].isReadOnly ? Icons.lock : Icons.lock_open,
            color: kGoodDarkGray3,
          )
        ],
      ),
    );
  }

  _onAddToCalendarClicked() async {
    //Failed to retrieve calendars
    if (_calendars == null) {
      _showSnackbar('Failed to retrieve calendars', 'Try Again',
          () => _retrieveCalendars());
      return;
    }

    //No calendars found
    if (_calendars.length == 0) {
      _showSnackbar(
          'No calendars found', 'Try again', () => _retrieveCalendars());
      return;
    }

    SimpleDialog dialog = _buildSimpleDialog();

    // show the dialog
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );

    //No calendar was selected
    if (_selectedCalendar == null) {
      _showNoActionSnackbar('Select a calendar to add event');
      return;
    }

    //Calender was selected
    _addEventToCalendar();
  }

  _buildAddToCalendarButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          left: 15,
          right: 20,
        ),
        width: 175,
        child: FlatButton(
          onPressed: _onAddToCalendarClicked,
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(FontAwesome.calendar),
              SizedBox(
                width: 8,
              ),
              Text('Add to Calender')
            ],
          ),
        ),
      ),
    );
  }

  /// Adding event to selected calendar
  void _addEventToCalendar() async {
    try {
      final eventToCreate = new Event(_selectedCalendarId);
      eventToCreate.title = 'Doctor appointment with Dr. Daisy Murphy';
      eventToCreate.start = DateTime.now();
      eventToCreate.end = DateTime.now().add(new Duration(minutes: 30));
      eventToCreate.description =
      'Appointment booked with Dr. Daisy Murphy at Mon 25 Feb - 1:00 PM';

      final createEventResult =
      await widget._deviceCalendarPlugin.createOrUpdateEvent(eventToCreate);

      if (createEventResult.isSuccess &&
          (createEventResult.data?.isNotEmpty ?? false)) {
        _showNoActionSnackbar('Event successfully added to calendar');
      }
    } on Exception catch (e) {
      _showSnackbar('Failed to add event to calendar', 'Try Again', () => _addEventToCalendar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            top: 100,
            bottom: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildHeader(),
              SizedBox(
                height: 10,
              ),
              _buildDetails(),
              SizedBox(
                height: 25,
              ),
              _buildAddToCalendarButton(),
              SizedBox(
                height: 10,
              ),
              Flexible(
                child: Image.asset('images/doctor2.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
