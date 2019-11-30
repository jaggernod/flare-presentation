import 'package:flutter/material.dart';

class FocusedText extends StatelessWidget {
  const FocusedText({Key key, @required this.text, this.color})
      : assert(text != null),
        super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context).primaryTextTheme.title.copyWith(color: color),
      ),
    );
  }
}
