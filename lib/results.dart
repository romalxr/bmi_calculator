import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class Results extends StatefulWidget {
  const Results({Key? key}) : super(key: key);

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    final calcBrain =
        ModalRoute.of(context)!.settings.arguments as CalculatorBrain;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(color: highlighting),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'YOUR RESULT',
              style: bigNumberTextStyle?.copyWith(fontSize: 36),
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: activeCard,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        calcBrain.getResult().toUpperCase(),
                        style: labelTextStyle?.copyWith(
                          color: Colors.green,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        calcBrain.calculateBMI(),
                        style: bigNumberTextStyle?.copyWith(fontSize: 100),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        calcBrain.getInterpretation(),
                        style: labelTextStyle?.copyWith(fontSize: 32),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: highlighting,
              height: bottomHeight,
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(
                child: Text(
                  'TRY AGAIN',
                  style: labelTextStyle?.copyWith(fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
