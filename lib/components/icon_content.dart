import 'package:flutter/material.dart';
import '../constant_styles.dart';

class IconContent extends StatelessWidget {

  IconContent({@required this.iconName, this.gender});

  final IconData iconName;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconName,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(gender,
          style: textStyle,
        ),
      ],
    );
  }
}