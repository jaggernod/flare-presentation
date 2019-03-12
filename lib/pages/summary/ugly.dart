import 'package:flutter/material.dart';
import 'package:flutter_app/pages/summary/bad.dart';

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
            child: SmallFocusedText(
              text: 'N/A',
            ),
          ),
        ),
      ],
    );
  }
}
