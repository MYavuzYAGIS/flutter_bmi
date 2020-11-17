import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Coming up with custom Theme
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          accentColor: Colors.cyan,
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white60))),

      home: InputPage(),
    );
  }
}

// this is the home page!. First time Alhamdulillah we started using different pages.

/// WE WANT CARDS TO BE BUTTONS BUT WE CANNOT USE FLAT BUTTONS SINCE THEY EFFECT THE STYLING OF THE BUTTON.
/// Instead, we will use GESTURE DETECTOR!
