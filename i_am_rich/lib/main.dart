import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('I am Rich'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: Image(
            image: NetworkImage('https://i1.wp.com/tripplus.co.kr/wp-content/uploads/2021/02/blog_the_trip_222249979391_1.jpg?w=696&ssl=1'),
          ),
        ),
      ),
    ),
  );
}
