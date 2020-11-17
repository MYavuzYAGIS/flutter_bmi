import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Text('Body Text'),
      ),
      // buttona theme vermek icin onu evvela theme widgeti ile wrap ettik
      //sonra data bekler bu widget, ona bir data verdik.
      // data the ThemeData Bekler. artik Themedata nin ici CSS gibi. istedigin
      //gibi degisiklik yapabilirisn. ister Material design kullan isgter custom color.
    );
  }
}
