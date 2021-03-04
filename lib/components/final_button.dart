import 'package:flutter/material.dart';

class FinalButton extends StatelessWidget {

  FinalButton({@required this.screenChange, @required this.buttonTitle});

  final Function screenChange;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: screenChange,
      child: Container(
        color: Color(0xFFeb3449),
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: 80,
        child: Center(
          child: Text(buttonTitle,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),
        ),
        ),
      ),
    );
  }
}