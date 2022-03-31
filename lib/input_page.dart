import 'package:bmi_calculator_flutter/icon_content.dart';
import 'package:bmi_calculator_flutter/results_page.dart';
import 'package:bmi_calculator_flutter/reuseable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_flutter/constants.dart';

enum GenderCard {
  male,
  female,
}

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderCard? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  // Color maleCardcolour = inactiveCardColour;
  // Color femaleCardcolour = inactiveCardColour;

  // //1 = male , 2  = female
  // void updateColour(GenderCard gender) {
  //   // male card pressed

  //   if (gender == GenderCard.male) {
  //     if (maleCardcolour == inactiveCardColour) {
  //       maleCardcolour = activeCardColour;
  //       femaleCardcolour = inactiveCardColour;
  //     } else {
  //       maleCardcolour = inactiveCardColour;
  //     }
  //     //female card pressed
  //   }
  //   if (gender == GenderCard.female) {
  //     if (femaleCardcolour == inactiveCardColour) {
  //       femaleCardcolour = activeCardColour;
  //       maleCardcolour = inactiveCardColour;
  //     } else {
  //       femaleCardcolour = inactiveCardColour;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderCard.male;
                      });
                    },
                    colour: selectedGender == GenderCard.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: const IconContent(
                      gender: 'MALE',
                      genderIcon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderCard.female;
                      });
                    },
                    colour: selectedGender == GenderCard.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: const IconContent(
                      gender: 'FEMALE',
                      genderIcon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              colour: kActiveCardColour,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RounedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPessed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RounedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPessed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RounedIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPessed: () {
                                  setState(() {
                                    age--;
                                    if (age < 0) {
                                      age = 50;
                                    }
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RounedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPessed: () {
                                setState(() {
                                  age++;
                                  if (age == 120) {
                                    age = 50;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => resultsPage()),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: KLargeButtonTextStyle,
                ),
              ),
              color: kBottomContainerColour,
              margin: const EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class RounedIconButton extends StatelessWidget {
  RounedIconButton({Key? key, required this.icon, required this.onPessed})
      : super(key: key);
  final IconData icon;
  final Function() onPessed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPessed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
