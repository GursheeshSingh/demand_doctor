import 'package:demand_doctor/components/bordered_circular_image.dart';
import 'package:demand_doctor/components/doctor_card.dart';
import 'package:demand_doctor/components/search_field.dart';
import 'package:demand_doctor/screens/steps/step_4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../constants.dart';

class Step3 extends StatelessWidget {
  static const String step_3 = '/step_3';

  final Function goForward;

  Step3(this.goForward);

  _buildButtons() {
    return Row(
      children: <Widget>[
        _buildViewProfileButton(),
        _buildBookAppointmentButton()
      ],
    );
  }

  _buildViewProfileButton() {
    return Expanded(
      child: Container(
        child: FlatButton(
          onPressed: () {},
          child: Text(
            'View Profile',
            style: TextStyle(color: kGoodPurple, fontSize: 12),
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: kGoodPurple,
              width: 2,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 5),
      ),
    );
  }

  _buildBookAppointmentButton() {
    return Expanded(
      child: Container(
        child: FlatButton(
          onPressed: () {
            goForward();
          },
          child: Text(
            'Book Appointment',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: kGoodPurple,
        ),
        margin: EdgeInsets.symmetric(horizontal: 5),
      ),
    );
  }

  _buildHeading() {
    return Text(
      //TODO: Make dynamic based on selection
      'Skin & Hair',
      style: kHeadingTextStyle,
    );
  }

  _buildDoctorCards() {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              border: Border.all(
                color: kGoodPurple,
                width: 0.4,
                style: BorderStyle.solid,
              ),
            ),
            child: Column(
              children: <Widget>[
                DoctorCard(
                  imageUrl:
                      'https://stylesatlife.com/wp-content/uploads/2015/07/Hairstyles-for-Small-Faces2.jpg',
                  name: 'Dr. Daisy Murphy',
                  positionExperience: 'Dematogolist. 11yrs exp.',
                  address: '3386 Sector 19/D CHD, 160019',
                ),
                _buildButtons(),
              ],
            ),
          );
        },
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
        Row(
          children: <Widget>[
            Expanded(
              child: SearchField(
                hintText: 'Search for Dermatologist',
              ),
            ),
            Container(
              color: kGoodMidGray,
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.only(left: 10),
              child: Icon(
                AntDesign.filter,
              ),
            )
          ],
        ),
        _buildDoctorCards()
      ],
    );
  }
}
