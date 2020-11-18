import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    _bmi >= 25
        ? 'Overweight'
        : _bmi > 18.5
            ? 'Healthy'
            : 'Underweight';
  }

  String getInterpretation() {
    _bmi >= 25
        ? 'You Should stop eating late and move a little'
        : _bmi > 18.5
            ? 'You Rock, Master!'
            : 'there are millions out there to be like you, but you should eat more!';
  }
}
