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
          title: Text('Calculate BMI',
              style: TextStyle(
                color: Colors.blueGrey,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              )),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFF1D1E32),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: Color(0xFF1D1E32),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: Color(0xFF1D1E32),
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D1E32),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D1E32),
                  ),
                ),
              ],
            ))
          ],
        )
        // buttona theme vermek icin onu evvela theme widgeti ile wrap ettik
        //sonra data bekler bu widget, ona bir data verdik.
        // data the ThemeData Bekler. artik Themedata nin ici CSS gibi. istedigin
        //gibi degisiklik yapabilirisn. ister Material design kullan isgter custom color.
        );
  }
}

// Starting Creating the Cards on the UI
class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour});
  Color colour;

  //widget olustururken 6 tane card icin 6 blok container kod yazdik. buna gerek olmasin diye de
  // extract widgete basarak otomatik olarak classa donusturduk.
  // bu blok kodu ureten flutter oldu.

  //constructor olusturduk. bu sekilde color prpopertysini manipulate edebiliyoruz.

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
    );
  }
}

//  Color(0xFF1D1E32)
