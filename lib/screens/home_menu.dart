import 'package:demand_doctor/components/image_icon.dart' as imageIcon;
import 'package:demand_doctor/components/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constants.dart';
import 'booking_appointment.dart';

class HomeMenu extends StatelessWidget {
  static const String home_menu = '/';

  final Function onBookingCompleted;

  HomeMenu({@required this.onBookingCompleted});

  @override
  Widget build(BuildContext context) {
    _buildAppBar() {
      return Container(
        height: 100,
        color: Colors.white,
        padding: EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      FontAwesome.map_marker,
                      color: kGoodPurple,
                      size: 20,
                    ),
                    Text(
                      'Your Location',
                      style: TextStyle(
                        color: kGoodLightGray,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '1476 Ocello Street, San Fransico',
                          overflow: TextOverflow.ellipsis,
                        ),
                        width: 150,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Icon(
                          AntDesign.down,
                          size: 16,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Icon(
              SimpleLineIcons.bell,
              color: Colors.black,
            ),
          ],
        ),
      );
    }

    _buildSearchField() {
      return Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: SearchField(
          hintText: 'Search for doctor, medicine, etc',
        ),
      );
    }

    _buildGridMenu() {
      return Expanded(
        child: Container(
          child: GridView.count(
            primary: false,
            crossAxisSpacing: 20,
            mainAxisSpacing: 15,
            crossAxisCount: 2,
            children: [
              CardItem(
                imageUrl: 'images/doctor.png',
                heading: 'Doctors',
                subheading: 'Book an appointment',
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookingAppointmentScreen(
                                onBookingCompleted: onBookingCompleted,
                              )));
                },
              ),
              CardItem(
                imageUrl: 'images/medicine.png',
                heading: 'Medicine',
                subheading: '1,00,000+ Medicines',
              ),
              CardItem(
                imageUrl: 'images/lab.png',
                heading: 'Lab Tests',
                subheading: 'Free sample collection',
              ),
              CardItem(
                imageUrl: 'images/chat.png',
                heading: 'Unlimited Chats',
                subheading: 'With 24 x 7 Doctor',
              ),
              CardItem(
                imageUrl: 'images/phone.png',
                heading: 'Audio Call',
                subheading: 'Request Callback',
              ),
              CardItem(
                imageUrl: 'images/video2.png',
                heading: 'Video Call',
                subheading: 'Request Video call',
              ),
            ],
          ),
        ),
      );
    }

    _buildHeading() {
      return Container(
        alignment: Alignment.centerLeft,
        child: Text(
          'What are you looking for?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
    }

    _buildBody() {
      return Expanded(
        child: Column(
          children: <Widget>[
            _buildHeading(),
            _buildSearchField(),
            _buildGridMenu(),
          ],
        ),
      );
    }

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            _buildAppBar(),
            _buildBody(),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String heading;
  final String subheading;
  final String imageUrl;
  final Function onClick;

  const CardItem({this.heading, this.subheading, this.imageUrl, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        elevation: 4,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              imageIcon.ImageIcon(
                imageUrl: imageUrl,
              ),
              Text(
                heading,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subheading,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: kGoodDarkGray,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
