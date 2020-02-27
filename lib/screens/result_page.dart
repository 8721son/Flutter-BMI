import 'package:flutter/material.dart';
import 'package:flutter_app/components/reusable_card.dart';
import 'package:flutter_app/constants.dart';

class ResultPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    print('ResultPage : ' + context.hashCode.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text('Your Result',
                  style: kTitleTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              mColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "UNDERWEIGHT",
                    style: kResultTextStyle,
                  ),
                  Text(
                    "17.7",
                    style: kBMITextStyle,
                  ),
                  Text(
                    "You have a lower than normal body weight. You can eat a bit more.",
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: kLargeButtonTextStyle,
                ),
              ),
              color: Colors.pink,
              width: double.infinity,
              height: 70.0,
            ),
          ),
        ],
      ),
    );
  }
}