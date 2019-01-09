import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Filip extends StatelessWidget {
  const Filip({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'This is Filip',
                style: Theme.of(context).primaryTextTheme.subhead,
              ),
              Text(
                'Filip has been presented on Flutter Live',
                style: Theme.of(context).primaryTextTheme.subhead,
              ),
              Text(
                'Filip has a problem',
                style: Theme.of(context).primaryTextTheme.subhead,
              ),
            ],
          ),
        ),
        Expanded(
          child: FlareActor(
            'assets/Filip.flr',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: 'idle',
          ),
        ),
      ],
    );
  }
}
