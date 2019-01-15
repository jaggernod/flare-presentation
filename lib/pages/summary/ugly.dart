import 'package:flutter/material.dart';

class Ugly extends StatelessWidget {
  const Ugly({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'The Ugly',
          style: Theme.of(context).primaryTextTheme.title,
        ),
        Expanded(
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(
                    constraints.biggest.longestSide,
                  ),
                  child: Image.asset(
                    'assets/tomek.jpg',
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
