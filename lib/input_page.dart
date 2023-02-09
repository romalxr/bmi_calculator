import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/icon_text_column.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/selectable_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Gender selectedGender = Gender.male;

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.male
                        ? activeCard
                        : inactiveCard,
                    child: const IconTextColumn(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    onPress: () => setState(() => selectedGender = Gender.male),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.female
                        ? activeCard
                        : inactiveCard,
                    child: const IconTextColumn(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    onPress: () =>
                        setState(() => selectedGender = Gender.female),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: activeCard,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: bigNumberTextStyle),
                      Text('cm', style: labelTextStyle),
                    ],
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white.withAlpha(35),
                    elevation: 5,
                    child: SliderTheme(
                      data: SliderThemeData(
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30),
                        thumbColor: highlighting,
                        overlayColor: highlighting.withAlpha(36),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: inactiveCard,
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (value) =>
                            setState(() => height = value.toInt()),
                        min: 120.0,
                        max: 220.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: activeCard,
                    child: SelectableData(
                      name: 'WEIGHT',
                      data: weight,
                      onMinus: () => setState(() => weight--),
                      onPlus: () => setState(() => weight++),
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  color: activeCard,
                  child: SelectableData(
                    name: 'AGE',
                    data: age,
                    onMinus: () => setState(() => age--),
                    onPlus: () => setState(() => age++),
                  ),
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(weight, height);
              Navigator.pushNamed(
                context,
                '/results',
                arguments: calc,
              );
            },
            child: Container(
              color: highlighting,
              height: bottomHeight,
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(
                child: Text(
                  'CALCULATE',
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
