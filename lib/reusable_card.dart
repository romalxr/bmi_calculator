import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget? child;
  final void Function()? onPress;

  const ReusableCard(
      {super.key, required this.color, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(15.0),
        child: child,
      ),
    );
  }
}
