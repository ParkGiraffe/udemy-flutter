import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

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

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: theme2,
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Text('Body Text'),
      ),
    );
  }
}
