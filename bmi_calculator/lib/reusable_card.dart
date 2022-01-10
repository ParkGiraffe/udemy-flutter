import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // const ReusableCard({
  //   Key? key,
  // }) : super(key: key);

  Color colour;
  Widget? cardChild;

  ReusableCard({required this.colour, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
      margin: EdgeInsets.all(15.0),
      child: cardChild,
    );
  }
}
