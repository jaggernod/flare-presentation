import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class FlareLogo extends StatefulWidget {
  const FlareLogo({Key key}) : super(key: key);

  @override
  FlareLogoState createState() => FlareLogoState();
}

class FlareLogoState extends State<FlareLogo> {
  bool _isPaused;

  @override
  void initState() {
    super.initState();

    _isPaused = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => setState(() => _isPaused = !_isPaused),
      child: FlareActor(
        'assets/flare_logo.flr',
        alignment: Alignment.center,
        fit: BoxFit.contain,
        isPaused: _isPaused,
        animation: 'Build and Fade Out',
      ),
    );
  }
}
