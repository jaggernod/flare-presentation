import 'package:flutter/material.dart';

class FocusedText extends StatelessWidget {
  const FocusedText({Key key, @required this.text})
      : assert(text != null),
        super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context)
            .primaryTextTheme
            .title
            .copyWith(color: Color(0xFF7A61F7)),
      ),
    );
  }
}
