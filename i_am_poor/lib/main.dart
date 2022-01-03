import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("I am Poor"),
          backgroundColor: Colors.black,
        ),
        body: const Center(
          child: Image(
            image: AssetImage('images/coal.png'),
          ),
        ),
        backgroundColor: Colors.grey,
      ),
    )
  );
}
