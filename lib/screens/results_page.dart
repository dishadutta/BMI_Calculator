import 'package:flutter/material.dart';
import '../constant_styles.dart';
import '../components/reusable_card.dart';
import '../components/final_button.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult, @required this.resultTitle, @required this.adviceTitle});

  final String bmiResult;
  final String resultTitle;
  final String adviceTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text('Your Result',
                style: titleTextStyle,
                ),
              ),
          ),
          ),
          Expanded(
            flex: 8,
            child: ReusableCards(
              newColor: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultTitle.toLowerCase(),
                    style: resultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: resultNumberStyle,
                  ),
                  Text(
                    adviceTitle,
                    textAlign: TextAlign.center,
                    style: adviceTextStyle,
                  )
                ],
              ),
            ),
          ),
          FinalButton(
            buttonTitle: 'Re-Calculate',
            screenChange: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
