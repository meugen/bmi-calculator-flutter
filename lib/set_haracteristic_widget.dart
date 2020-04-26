import 'package:flutter/material.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SetCharacteristicWidget extends StatelessWidget {

  final String title;
  final int value;
  final Function onIncrease;
  final Function onDecrease;

  SetCharacteristicWidget({
    @required this.title,
    @required this.value,
    @required this.onIncrease,
    @required this.onDecrease
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: kLabelTextStyle,
        ),
        Text(
          value.toString(),
          style: kValueTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: onDecrease,
            ),
            SizedBox(
              width: 10,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: onIncrease,
            ),
          ],
        )
      ],
    );
  }
}
