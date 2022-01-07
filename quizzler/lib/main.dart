import 'package:flutter/material.dart';
import './question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Widget> scoreKeeper = [];

  List<Question> questionBank = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
  ];

  int questionNumber = 0;

  void plusQuestionNumber() {
    setState(() {
      if (questionNumber == 2) {
        questionNumber = 0;
      } else {
        questionNumber++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                print('True');
                plusQuestionNumber();
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                print('False');
                plusQuestionNumber();
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
