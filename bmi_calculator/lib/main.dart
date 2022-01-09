import 'package:flutter/material.dart';
import './input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: theme2,
    );
  }
}

final theme1 = ThemeData(
  scaffoldBackgroundColor: Color(0xFF0A0E21),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
    ),
  ),
  colorScheme: ThemeData().colorScheme.copyWith(
        primary: Color(0xFF0A0E21),
        secondary: Colors.purple,
      ),
);

final theme2 = ThemeData.dark().copyWith(
  // primaryColor: Color(0xFF0A0E21),
  scaffoldBackgroundColor: Color(0xFF0A0E21),
  colorScheme: ColorScheme.light().copyWith(
    secondary: Colors.purple,
    primary: Color(0xFF0A0E21),
  ),
);
