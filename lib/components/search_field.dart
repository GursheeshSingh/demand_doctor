import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constants.dart';

class SearchField extends StatelessWidget {

  final String hintText;
  final IconData iconData;

  const SearchField({this.hintText, this.iconData = FontAwesome.search});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        filled: true,
        fillColor: kGoodMidGray,
        prefixIcon: Container(
          margin: EdgeInsets.only(
            right: 10,
            left: 10,
          ),
          child: Icon(
            iconData,
            color: kGoodDarkGray2,
          ),
        ),
      ),
      cursorColor: kGoodDarkGray2,
    );
  }
}
