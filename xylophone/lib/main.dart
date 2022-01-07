import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Widget buildKey({int soundNumber = 1, Color colorName = Colors.red}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(soundNumber);
        },
        style: TextButton.styleFrom(
          primary: colorName,
          backgroundColor: colorName,
        ),
        child: Text("$soundNumber"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(soundNumber: 1, colorName: Colors.red),
              buildKey(soundNumber: 2, colorName: Colors.orange),
              buildKey(soundNumber: 3, colorName: Colors.yellow),
              buildKey(soundNumber: 4, colorName: Colors.green),
              buildKey(soundNumber: 5, colorName: Colors.teal),
              buildKey(soundNumber: 6, colorName: Colors.blue),
              buildKey(soundNumber: 7, colorName: Colors.purple,)
            ],
          ),
        ),
      ),
    );
  }
}
