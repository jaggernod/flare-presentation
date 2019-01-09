import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  const Slide({
    Key key,
    @required this.child,
    this.colors = const [Color(0xFF3079BF), Color(0xFF204E81)],
  }) : super(key: key);

  final Widget child;

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0.1, 0.5),
          radius: 0.8,
          colors: colors,
          stops: [0.2, 1.0],
        ),
      ),
      child: child,
    );
  }
}
