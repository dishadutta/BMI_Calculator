import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, @required this.onChange});

  final IconData icon;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onChange,
      elevation: 4,
      constraints: BoxConstraints.tightFor(
          height: 56,
          width: 56
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF50476e),
    );
  }
}