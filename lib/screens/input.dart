import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constant_styles.dart';
import '../components/round_button.dart';
import '../components/final_button.dart';
import 'results_page.dart';
import 'package:bmi_calculator/calculator_bmi.dart';

enum GenderType {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  int height = 80;
  int weight = 20;
  int age = 4;
  GenderType selectedGender;

// for checking the selected card using if else statement
//  Color maleCardColor = inActiveCardColor;
//  Color femaleCardColor = inActiveCardColor;
//
//  void updateActvity(GenderType genderSelection){
//    //when male card is pressed
//    if(genderSelection == GenderType.male){
//      if(maleCardColor == inActiveCardColor){
//        maleCardColor = activeCardColor;
//        femaleCardColor = inActiveCardColor;
//      }
//    }
//    //when female card is pressed
//    else if(genderSelection == GenderType.female){
//      if(femaleCardColor == inActiveCardColor){
//        femaleCardColor = activeCardColor;
//        maleCardColor = inActiveCardColor;
//      }
//    }
//  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                child: ReusableCards(
                  onPressChange: (){
                    setState(() {
                      selectedGender = GenderType.male;
                    });
                  },
                  newColor: selectedGender == GenderType.male ? activeCardColor : inActiveCardColor,
                  cardChild: IconContent(iconName: FontAwesomeIcons.mars, gender: 'MALE',),
              ),
              ),
              Expanded(
                child: ReusableCards(
                  onPressChange: (){
                    setState(() {
                      selectedGender = GenderType.female;
                    });
                  },
                  newColor: selectedGender == GenderType.female ? activeCardColor : inActiveCardColor,
                  cardChild: IconContent(iconName: FontAwesomeIcons.venus, gender: 'FEMALE',),
              ),
              ),
            ],
          ),
          ),
          Expanded(
            child: ReusableCards(
            newColor: activeCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT',
                style: textStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: labelStyle,
                    ),
                    Text('cm',
                    style: textStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFeb3449),
                    overlayColor: Color(0x29eb3449),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 0,
                    max: 250,
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.toInt();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          ),
          Expanded(
            child: Row(
            children: [
              Expanded(child: ReusableCards(
                newColor: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('WEIGHT',
                    style: textStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: labelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onChange: (){
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onChange: (){
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ),
              Expanded(child: ReusableCards(
                newColor: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('AGE',
                      style: textStyle,
                    ),
                    Text(
                      age.toString(),
                      style: labelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onChange: (){
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onChange: (){
                            setState(() {
                              age++;
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
          FinalButton(
            buttonTitle: 'Calculate',
            screenChange: (){
              Calculator calc = Calculator(height: height, weight:weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultTitle: calc.getResultTitle(),
                    adviceTitle: calc.getAdviceTitle(),
                  ),
                ),
              );
            },
          )
        ],
      )
    );
  }
}

