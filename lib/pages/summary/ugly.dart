import 'package:flutter/material.dart';

class Ugly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => ClipRRect(
            borderRadius: BorderRadius.circular(
              constraints.biggest.longestSide,
            ),
            child: Image.asset(
              'assets/tomek.jpg',
              fit: BoxFit.cover,
            ),
          ),
    );
  }
}
