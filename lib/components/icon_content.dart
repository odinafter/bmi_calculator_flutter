import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    Key? key,
    required this.gender,
    required this.genderIcon,
  }) : super(key: key);

  final String gender;
  final IconData genderIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(gender, style: kLabelTextStyle),
      ],
    );
  }
}
