import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

const List<Widget> traits = const [
  Amazing(),
  PureFlutter(),
];

class Good extends StatefulWidget {
  const Good({Key key}) : super(key: key);

  @override
  GoodState createState() => GoodState();
}

class GoodState extends State<Good> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onDoubleTap: () => setState(() => index = (index + 1) % traits.length),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The Good',
            style: Theme.of(context).primaryTextTheme.title,
          ),
          Expanded(
            child: Center(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: traits[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Amazing extends StatelessWidget {
  const Amazing({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "It's amazing!",
          style: Theme.of(context).primaryTextTheme.title,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 72,
            height: 72,
            child: FlareActor(
              'assets/meteor.flr',
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: 'Idle',
            ),
          ),
        )
      ],
    );
  }
}

class PureFlutter extends StatelessWidget {
  const PureFlutter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Pure Flutter!',
          style: Theme.of(context).primaryTextTheme.title,
        ),
        FlutterLogo(size: 72),
      ],
    );
  }
}
