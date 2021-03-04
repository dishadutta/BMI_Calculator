import 'package:flutter/material.dart';

class ReusableCards extends StatelessWidget {
//  const ReusableCards({
//    Key key,
//  }) : super(key: key);
  ReusableCards({@required this.newColor, this.cardChild, this.onPressChange});
  final Color newColor;
  final Widget cardChild;
  final Function onPressChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressChange,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: newColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}