import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPress});
  final Color colour;
  //we are creating new reausabble card as widget
  final Widget cardChild;
  //final makes the property immutable.

  final Function onPress;
  //widget olustururken 6 tane card icin 6 blok container kod yazdik. buna gerek olmasin diye de
  // extract widgete basarak otomatik olarak classa donusturduk.
  // bu blok kodu ureten flutter oldu.

  //constructor olusturduk. bu sekilde color prpopertysini manipulate edebiliyoruz.

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}
