import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8F8E98),
);
const sizedBoxHeight = 15.0;
const iconSize = 80.0;

class iconContent extends StatelessWidget {
  iconContent({this.icon, this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        Text(
          label,
          style: labelTextStyle,
        )
      ],
    );
  }
}
