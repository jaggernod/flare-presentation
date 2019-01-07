import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare/math/mat2d.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  // Desktop platforms are not recognized as valid targets by
  // Flutter; force a specific target to prevent exceptions.
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flare Presentation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GrokePage(title: 'Groke Page'),
    );
  }
}

class GrokePage extends StatefulWidget {
  GrokePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _GrokePageState createState() => _GrokePageState();
}

class _GrokePageState extends State<GrokePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: <Widget>[
            Expanded(
              child: FlareActor(
                'assets/gorke.flr',
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: 'HeadTilt',
              ),
            ),
          ],
        ));
  }
}

class Groke extends StatefulWidget {
  const Groke({Key key}) : super(key: key);

  @override
  _GrokeState createState() => _GrokeState();
}

enum Mood { scare, smile }

const _kRubbingThreshold = 10000;

class _GrokeState extends State<Groke> implements FlareController {
  double _speed = 2.0;
  double _scareFactorAmount = 0.1;
  double _scareTime = 0.0;
  double _smileTime = 0.0;

  double _smileFactorAmount = 0.0;

  ActorAnimation _scareAnimation;
  ActorAnimation _smileAnimation;

  Mood _mood;

  @override
  void initState() {
    super.initState();

    _mood = Mood.scare;
  }

  @override
  Widget build(BuildContext context) {
    return RubDetector(
      isEnabled: _mood == Mood.scare,
      onRubbed: () {
        setState(() => _mood = Mood.smile);
      },
      child: FlareActor(
        'assets/groke.flr',
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: 'HeadTilt',
        controller: this,
      ),
    );
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    _scareTime += elapsed * _speed;
    _smileTime += elapsed * _speed;

    if (_mood == Mood.smile) {
      if (_scareFactorAmount != 0) {
        // We do not want to disturb the Scary animation so we wait until it ends
        if (_scareTime % _scareAnimation.duration < 0.1) {
          _scareFactorAmount = 0;
          _smileFactorAmount = 1.0;
          _scareTime = 0;
        }
      }
    }

    _scareAnimation.apply(
      _scareTime % _scareAnimation.duration,
      artboard,
      _scareFactorAmount,
    );
    _smileAnimation.apply(
      _smileTime % _smileAnimation.duration,
      artboard,
      _smileFactorAmount,
    );

    return true;
  }

  @override
  void initialize(FlutterActorArtboard artboard) {
    // The scary animation
    _scareAnimation = artboard.getAnimation('Scare');

    // The smiling animation
    _smileAnimation = artboard.getAnimation('Smile');
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}
}

class RubDetector extends StatefulWidget {
  final Widget child;
  final bool isEnabled;
  final VoidCallback onRubbed;

  const RubDetector({
    Key key,
    @required this.child,
    @required this.onRubbed,
    this.isEnabled = false,
  })  : assert(child != null),
        assert(onRubbed != null),
        super(key: key);

  @override
  RubDetectorState createState() => RubDetectorState();
}

class RubDetectorState extends State<RubDetector> {
  double _initial;

  double _distance;

  @override
  void initState() {
    super.initState();

    _initial = 0.0;
    _distance = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (DragStartDetails details) {
        _initial = details.globalPosition.dx;
        _distance = 0;
      },
      onPanUpdate: (DragUpdateDetails details) {
        double distance = details.globalPosition.dx - _initial;
        _distance += distance.abs();

        if (widget.isEnabled && _distance > _kRubbingThreshold) {
          widget.onRubbed();
        }
      },
      onPanEnd: (DragEndDetails details) {
        _initial = 0.0;
        _distance = 0;
      },
      child: widget.child,
    );
  }
}
