import 'package:demand_doctor/components/image_icon.dart' as imageIcon;
import 'package:demand_doctor/components/date_selector.dart';
import 'package:demand_doctor/components/doctor_card.dart';
import 'package:demand_doctor/components/time_period.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../constants.dart';

class Step5 extends StatelessWidget {
  static const String step_5 = '/step_5';

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

  _buildHeading(String heading) {
    return Text(
      heading,
      style: kHeadingTextStyle,
    );
  }

  //TODO: ADD Click
  _buildImageCard(String imageUrl, String title) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: ListTile(
          leading: imageIcon.ImageIcon(
            imageUrl: imageUrl,
            imagePadding: 5,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(
            FontAwesome.chevron_right,
            color: kGoodLightGray,
          ),
        ),
      ),
    );
  }

  //TODO: ADD Click
  _buildIconCard(Icon icon, String title) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: ListTile(
          leading: icon,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(
            FontAwesome.chevron_right,
            color: kGoodLightGray,
          ),
        ),
      ),
    );
  }

  _buildNotesHeading() {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
          text: 'Notes',
          style: kHeadingTextStyle,
        ),
        TextSpan(
          text: ' ( Optional )',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ]),
    );
  }

  _buildNotesField() {
    return Container(
      height: 125,
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        decoration: InputDecoration(
          hintText: 'Enter notes',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
      ),
    );
  }

  _buildTermsAndConditionsNote() {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
          text: 'By booking the appointment you agree to the ',
          style: TextStyle(
            color: kGoodDarkGray,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextSpan(
          text: 'T&C',
          style: TextStyle(
            color: kGoodPurple,
            fontWeight: FontWeight.w500,
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _buildHeading('Review and Book'),
          SizedBox(
            height: 10,
          ),
          _buildSelectedDoctorCard(),
          SizedBox(
            height: 16,
          ),
          _buildHeading('Appointment for?'),
          SizedBox(
            height: 10,
          ),
          _buildImageCard('images/myself.png', 'Myself'),
          SizedBox(
            height: 16,
          ),
          _buildHeading('Visit Reason'),
          SizedBox(
            height: 10,
          ),
          _buildImageCard('images/hair.png', 'Skin & Hair'),
          SizedBox(
            height: 16,
          ),
          _buildHeading('Date and Time'),
          SizedBox(
            height: 10,
          ),
          _buildIconCard(
            Icon(
              MaterialIcons.wb_sunny,
              color: kGoodPurple,
            ),
            'Skin & Hair',
          ),
          SizedBox(
            height: 16,
          ),
          _buildNotesHeading(),
          SizedBox(
            height: 10,
          ),
          _buildNotesField(),
          SizedBox(
            height: 10,
          ),
          _buildTermsAndConditionsNote()
        ],
      ),
    );
  }
}
