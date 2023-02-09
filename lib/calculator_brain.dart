import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;

  late double _bmi;

  CalculatorBrain(this.weight, this.height) {
    _bmi = weight / pow(height / 100, 2);
  }

  String calculateBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    String result = '';
    if (_bmi >= 25) {
      result = 'Zhirnyi';
    } else if (_bmi >= 18.5) {
      result = 'Normas';
    } else {
      result = 'Drishch';
    }
    return result;
  }

  String getInterpretation() {
    String result = '';
    if (_bmi >= 25) {
      result =
          'You have a higher than normal body weight.\nTry to exercise more.';
    } else if (_bmi >= 18.5) {
      result = 'You have a normal body weight. Good job!';
    } else {
      result = 'You have a lower than normal body weight.\nTry to eat more.';
    }
    return result;
  }
}
