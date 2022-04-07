import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/screens/input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF090C22),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Color(0xFF070A19),
        ),
      ),
      home: InputPage(),
    );
  }
}
