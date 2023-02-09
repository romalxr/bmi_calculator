import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class SelectableData extends StatelessWidget {
  const SelectableData({
    Key? key,
    required this.name,
    required this.data,
    this.onMinus,
    this.onPlus,
  }) : super(key: key);

  final String name;
  final int data;
  final VoidCallback? onMinus;
  final VoidCallback? onPlus;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: labelTextStyle,
        ),
        Text(
          data.toString(),
          style: bigNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: onMinus,
            ),
            const SizedBox(width: 10),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: onPlus,
            ),
          ],
        ),
      ],
    );
  }
}
