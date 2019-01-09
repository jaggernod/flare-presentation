import 'package:flutter/material.dart';

class End extends StatelessWidget {
  const End({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Questions?',
        style: Theme.of(context).primaryTextTheme.title,
      ),
    );
  }
}
