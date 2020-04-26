import 'dart:math';

class CalculatorBrain {

  BmiResult calculateBmi(int weight, int height) {
    double bmi = weight / pow(height/100, 2);
    if (bmi >= 25) {
      return BmiResult(
        bmi,
        'Overweight',
        'You have a higher than normal body weight. Try to exercise more.'
      );
    } else if (bmi > 18.5) {
      return BmiResult(
        bmi,
        'Normal',
        'You have a normal body weight. Good job!'
      );
    } else {
      return BmiResult(
        bmi,
        'Lowerweight',
        'You have a lower than normal body weight. You can eat a bit more.',
      );
    }
  }
}

class BmiResult {

  final double _bmi;
  final String result;
  final String interpretation;

  BmiResult(
    this._bmi,
    this.result,
    this.interpretation
  );

  String stringBmi() {
    return _bmi.toStringAsFixed(1);
  }
}