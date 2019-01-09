import 'package:flutter/material.dart';

class FlareInfo extends StatelessWidget {
  const FlareInfo({
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
          RichText(
            text: TextSpan(
              text: 'What is ',
              style: Theme.of(context).primaryTextTheme.title,
              children: <TextSpan>[
                TextSpan(
                  text: 'Flare'.toUpperCase(),
                  style: Theme.of(context)
                      .primaryTextTheme
                      .title
                      .copyWith(letterSpacing: 5.0),
                ),
                TextSpan(
                  text: '?',
                  style: Theme.of(context).primaryTextTheme.title,
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: '“Flare offers powerful realtime ',
                  style: Theme.of(context).primaryTextTheme.caption,
                  children: [
                    TextSpan(
                      text: 'vector',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .caption
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' design and animation '
                          'for app and game designers alike.\nThe primary goal of '
                          'Flare is to allow designers to work directly with assets '
                          'that run in their final product, eliminating the need to redo that work in code.”',
                      style: Theme.of(context).primaryTextTheme.caption,
                    ),
                  ],
                ),
              ),
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
