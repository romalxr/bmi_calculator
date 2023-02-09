import 'package:bmi_calculator/results.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const InputPage(),
        '/results': (context) => const Results(),
      },
      theme: ThemeData.dark().copyWith(
        colorScheme: ThemeData.dark().colorScheme.copyWith(
              secondary: Colors.grey[600],
            ),
        scaffoldBackgroundColor: Colors.black,
      ),
      initialRoute: '/',
      //home: const InputPage(),
    );
  }
}
