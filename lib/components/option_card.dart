import 'package:demand_doctor/components/image_icon.dart' as imageIcon;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants.dart';

class OptionCard extends StatefulWidget {
  OptionCard({
    @required this.imageUrl,
    @required this.text,
    this.onTap,
    @required this.optionIndex,
    @required this.selectedOption,
  });

  final String imageUrl;
  final String text;
  final Function onTap;
  final int optionIndex;
  int selectedOption;

  @override
  _OptionCardState createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap();
        }
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        color: (widget.optionIndex == widget.selectedOption)
            ? kGoodPurple
            : Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              child: imageIcon.ImageIcon(
                imageUrl: widget.imageUrl,
                imagePadding: 5,
                height: 50,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
            ),
            Flexible(
              child: Text(
                widget.text,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
