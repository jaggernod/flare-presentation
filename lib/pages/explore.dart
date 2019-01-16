import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  const Explore({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(48.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The Playground',
            style: Theme.of(context).primaryTextTheme.title,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Image.asset('assets/explore.png')),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              '- 2dimensions.com',
              style: Theme.of(context).primaryTextTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}