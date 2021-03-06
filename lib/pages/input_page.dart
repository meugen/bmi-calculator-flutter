import 'package:bmi_calculator/pages/results_page.dart';
import 'package:bmi_calculator/components/set_haracteristic_widget.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'gender_state.dart';
import 'package:bmi_calculator/common/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState(CalculatorBrain());
}

class _InputPageState extends State<InputPage> {

  final CalculatorBrain _brain;

  double _height = 180.0;
  int _weight = 60;
  int _age = 19;
  GenderState _genderState =
      GenderState.defaultState(kActiveCardColor, kInactiveCardColor);

  _InputPageState(this._brain);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        _genderState = _genderState.onMaleTap();
                      });
                    },
                    cardColor: _genderState.maleCardColor(),
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        _genderState = _genderState.onFemaleTap();
                      });
                    },
                    cardColor: _genderState.femaleCardColor(),
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            cardColor: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      _height.floor().toString(),
                      style: kValueTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x1FEB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30,
                      )),
                  child: Slider(
                    value: _height,
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        _height = newValue;
                      });
                    },
                  ),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: SetCharacteristicWidget(
                      title: 'WIGHT',
                      value: _weight,
                      onIncrease: () {
                        setState(() {
                          _weight++;
                        });
                      },
                      onDecrease: () {
                        setState(() {
                          _weight--;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: SetCharacteristicWidget(
                      title: 'AGE',
                      value: _age,
                      onIncrease: () {
                        setState(() {
                          _age++;
                        });
                      },
                      onDecrease: () {
                        setState(() {
                          _age--;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            text: 'CALCULATE',
            onTap: () {
              BmiResult result = _brain.calculateBmi(_weight, _height.floor());
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(result),
                  ));
            },
          )
        ],
      ),
    );
  }
}

