import 'package:flutter/material.dart';

class MyDotsApp extends StatelessWidget {
  final int currentIndex;

  const MyDotsApp({Key? key, required this.currentIndex}) : super(key: key);

  Color _getColor(int index) {
    return index == currentIndex ? Colors.white : Colors.white38;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 7,
          width: 7,
          decoration: BoxDecoration(
            color: _getColor(0),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 7,
          width: 7,
          decoration: BoxDecoration(
            color: _getColor(1),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 7,
          width: 7,
          decoration: BoxDecoration(
            color: _getColor(2),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
