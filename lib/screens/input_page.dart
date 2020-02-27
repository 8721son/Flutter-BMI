import 'package:flutter_app/components/reusable_card.dart';
import 'package:flutter_app/components/round_icon_button.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    mColor: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                    cardChild: Column(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'MALE',
                          style: kLableTextStyle,
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  child: ReusableCard(
                    onPress: () {
                      print(Gender.female);
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    mColor: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                    cardChild: Column(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'FEMALE',
                          style: kLableTextStyle,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          Expanded(
            child: ReusableCard(
              mColor: kActiveCardColor,
              cardChild: Column(
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLableTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: '178', style: kNumberTextStyle),
                            TextSpan(text: ' cm', style: kLableTextStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Colors.pink,
                      overlayColor: Colors.pink,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
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
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLableTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(child: RoundIconButton(onPressed: (){
                              setState(() {
                                weight = weight + 1;
                              });
                            }, icon: FontAwesomeIcons.plus,)),
                            Expanded(child: RoundIconButton(onPressed: (){
                              setState(() {
                                weight = weight - 1;
                              });
                            }, icon: FontAwesomeIcons.minus,)),
                          ],
                        )
                      ],
                    ),
                    mColor: kActiveCardColor,
                  )),
              Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLableTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(child: RoundIconButton(onPressed: (){
                              setState(() {
                                age = age + 1;
                              });
                            }, icon: FontAwesomeIcons.plus,)),
                            Expanded(child: RoundIconButton(onPressed: (){
                              setState(() {
                                age = age - 1;
                              });
                            }, icon: FontAwesomeIcons.minus,)),
                          ],
                        )
                      ],
                    ),
                    mColor: kActiveCardColor,
                  )),
            ],
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultPage()),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: kLargeButtonTextStyle,
                ),
              ),
              color: Colors.pink,
              width: double.infinity,
              height: 70.0,
            ),
          )
        ],
      ),
    );
  }
}