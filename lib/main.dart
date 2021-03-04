import 'package:flutter/material.dart';
import 'screens/input.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0XFF070817),
            scaffoldBackgroundColor: Color(0XFF070817),
            textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Color(0xFFFFFFFF),
                )
            )
      ),
      home: InputPage(),
    );
  }
}