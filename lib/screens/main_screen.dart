import 'package:demand_doctor/components/common_navigation_bar.dart';
import 'package:demand_doctor/screens/appointment_completed_screen.dart';
import 'package:demand_doctor/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constants.dart';
import 'calender_page.dart';
import 'home_menu.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  static bool showBooking = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Feather.home,
              color: kGoodLightGray,
            ),
            title: Text('HOME'),
            activeIcon: Icon(
              Feather.home,
              color: kGoodPurple,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesome.calendar,
              color: kGoodLightGray,
            ),
            title: Text('CALENDAR'),
            activeIcon: Icon(
              FontAwesome.calendar,
              color: kGoodPurple,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              EvilIcons.user,
              color: kGoodLightGray,
              size: 36,
            ),
            title: Text('PROFILE'),
            activeIcon: Icon(
              EvilIcons.user,
              color: kGoodPurple,
              size: 36,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: CommonBottomNavigationBar(
          selectedIndex: _selectedIndex,
          navigatorKeys: _navigatorKeys,
          children: <Widget>[
            HomeMenu(
              onBookingCompleted: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AppointmentCompletedScreen()));
              },
            ),
            CalenderPage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}
