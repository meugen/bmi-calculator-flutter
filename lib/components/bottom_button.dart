import 'package:flutter/material.dart';
import 'package:bmi_calculator/common/constants.dart';

class BottomButton extends StatelessWidget {

  final String text;
  final Function onTap;

  const BottomButton({
    @required this.text,
    @required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}