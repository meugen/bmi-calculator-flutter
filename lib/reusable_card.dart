import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  final Color cardColor;
  final Widget cardChild;
  final Function onTap;

  ReusableCard({
    @required this.cardColor,
    this.cardChild,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}