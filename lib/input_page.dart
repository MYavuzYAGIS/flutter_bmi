import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E32);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Color maleCardColour = inactiveCardColor;
Color femaleCardColour = inactiveCardColor;

//1 mele 2 female
void updateColor(int gender) {
  //male pressed
  if (gender == 1) {
    if (maleCardColour == inactiveCardColor) {
      maleCardColour = activeCardColor;
      femaleCardColour = inactiveCardColor;
    } else {
      maleCardColour = inactiveCardColor;
      femaleCardColour = activeCardColor;
    }
  } else if (gender == 2) {
    if (femaleCardColour == inactiveCardColor) {
      femaleCardColour = activeCardColor;
      maleCardColour = inactiveCardColor;
    } else {
      femaleCardColour = inactiveCardColor;
      maleCardColour = activeCardColor;
    }
  }
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
        body: Column(children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColour,
                      cardChild: iconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(2);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColour,
                      cardChild: iconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activeCardColor,
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: activeCardColor,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: activeCardColor,
                ),
              ),
            ],
          )),
          //Below is the bottom row.
          //  width : double.infinity ekrean boyutu ne olurssa olsun tamamini kapla demek.
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 11.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ), // bottom red bar
        ])
        // buttona theme vermek icin onu evvela theme widgeti ile wrap ettik
        //sonra data bekler bu widget, ona bir data verdik.
        // data the ThemeData Bekler. artik Themedata nin ici CSS gibi. istedigin
        //gibi degisiklik yapabilirisn. ister Material design kullan isgter custom color.
        );
  }
}

// Starting Creating the Cards on the UI

//  Color(0xFF1D1E32)

/*
* final vs const:
* reusablecard olusturgumuz zaman bize error verdi. sebebi classin kendisi immutable olmasina ragmen
* proprtysi final degildi
* peki final ne ?
*Flutter, lego gibi. bir widget olusturdugumuz zaman, stateless widget mesela, single lego block olarak dusunmek laizm onu.
* bunu saglamak icin flutter bunun tum propertylerinin de immutable olmasini istiyor.
* o nedenle final lazim properrty declarationun basina.
* Stateless widgets IMMUTABLEdir bir kere yuaparsin sonra degismez.
* final value of the color olur
*
* Final ve Const arasinda ne var ?
*
* 
*
*
*
*
* */
