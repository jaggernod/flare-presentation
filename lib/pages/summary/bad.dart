import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

const List<Widget> _badTraits = const [
  SmallFocusedText(
    text: 'Needs optimising',
    key: Key('Needs optimising'),
  ),
  SmallFocusedText(
    text: 'Documentation needs polishing',
    key: Key('Documentation needs polishing'),
  ),
  SmallFocusedText(
    text: 'The Web Tool needs love',
    key: Key('The Web Tool needs love'),
  ),
  SmallFocusedText(
    text: 'The Web Tool needs love',
    key: Key('The Web Tool needs love'),
  ),
  AmeliaCheat(),
];

class Bad extends StatefulWidget {
  const Bad({Key key}) : super(key: key);

  @override
  BadState createState() => BadState();
}

class BadState extends State<Bad> {
  int index;

  @override
  void initState() {
    super.initState();

    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onDoubleTap: () =>
          setState(() => index = (index + 1) % _badTraits.length),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The Bad',
            style: Theme.of(context).primaryTextTheme.title,
          ),
          Expanded(
            child: Center(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: _badTraits[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SmallFocusedText extends StatelessWidget {
  const SmallFocusedText({
    Key key,
    @required this.text,
  })  : assert(text != null),
        super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).primaryTextTheme.title,
    );
  }
}

class AmeliaCheat extends StatelessWidget {
  const AmeliaCheat({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'API is not yet complete',
          textAlign: TextAlign.center,
          style: Theme.of(context).primaryTextTheme.title,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 88,
            height: 88,
            child: FlareActor(
              'assets/Amelia Earhart_v2.flr',
              animation: 'Untitled',
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
          ),
        )
      ],
    );
  }
}
