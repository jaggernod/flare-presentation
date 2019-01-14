import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Good extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "It's amasing",
          style: Theme.of(context).primaryTextTheme.subhead,
        ),
        SizedBox(
          width: 72,
          height: 72,
          child: FlareActor(
            'assets/meteor.flr',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: 'Idle',
          ),
        )
      ],
    );
  }
}
