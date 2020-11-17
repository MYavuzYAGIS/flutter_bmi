import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'customButton.dart';

// Learning Enums

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 50;
  int age = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Body Mass Index Calculator',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                )),
          ),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: iconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: iconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kBoldText,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Colors.white,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 18.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          thumbColor: Color(0xFFEB1555),
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0x29EB1555),
                        ),
                        child: Slider(
                          min: kMinHeight,
                          max: kMaxHeight,
                          divisions: kSliderDivisions,
                          activeColor: Color(0xFFEB1555),
                          value: height.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ), // Middle Slider
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT', style: kLabelTextStyle),
                          Text(
                            weight.toString(),
                            style: kBoldText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight = weight + 1;
                                    print(weight);
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight = weight - 1;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kBoldText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age = age + 1;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age = age - 1;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )), // Bottom Twins
              //Below is the bottom row.
              //  width : double.infinity ekrean boyutu ne olurssa olsun tamamini kapla demek.
              Container(
                color: kBottomContainerColor,
                margin: EdgeInsets.only(top: 11.0),
                width: double.infinity,
                height: kBottomContainerHeight,
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
*  Flutter Takes Widget composition over Inheritance!
* Create A Widget When You can!
*
* Instad of writing a button by manipulating an existing button and overriding,
* we take the basic components and write it from scratch
*
*
*
* */
