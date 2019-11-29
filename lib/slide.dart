import 'package:flutter/material.dart';
import 'package:flutter_app/wave/wave_clipper.dart';

class WaveSlide extends StatefulWidget {
  const WaveSlide({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _WaveSlideState createState() => _WaveSlideState();
}

class _WaveSlideState extends State<WaveSlide>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> waveAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this)
          ..addListener(() => setState(() {}));

    waveAnimation = Tween(
      begin: 0.7,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInCubic));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        widget.child,
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomPaint(
            painter: WavePainter(
              enable: false,
              toControlPoints: _lightControlPoints,
              toEndPoints: _lightEndPoints,
            ),
            child: ClipPath(
              clipper: WaveClipper(
                weight: waveAnimation.value,
                toControlPoints: _lightControlPoints,
                toEndPoints: _lightEndPoints,
              ),
              child: Container(
                color: Color(0xFFDBD4ED),
                height: 175,
                width: double.infinity,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomPaint(
            painter: WavePainter(
              enable: false,
              toControlPoints: _darkControlPoints,
              toEndPoints: _darkEndPoints,
            ),
            child: ClipPath(
              clipper: WaveClipper(
                weight: waveAnimation.value,
                toControlPoints: _darkControlPoints,
                toEndPoints: _darkEndPoints,
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: const [Color(0xFF5C4297), Color(0xFF9988F1)],
                    stops: [0.2, 1.0],
                  ),
                ),
                height: 180,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List<Offset> _lightControlPoints(Size size) => [
      _fromRelative(size, 0.12, 0.0),
      _fromRelative(size, 0.12, -0.06),
      _fromRelative(size, 0.47, 0.9),
      _fromRelative(size, 0.8, 0.5),
    ];

List<Offset> _lightEndPoints(Size size) => [
      _fromRelative(size, 0, 0.4),
      _fromRelative(size, 0.24, 0.3),
      _fromRelative(size, 0.63, 0.7),
      _fromRelative(size, 0.95, 1.0),
    ];

List<Offset> _darkControlPoints(Size size) => [
      _fromRelative(size, 0.12, 0.1),
      _fromRelative(size, 0.12, 0.1),
      _fromRelative(size, 0.47, 1),
      _fromRelative(size, 0.75, 0.7),
    ];

List<Offset> _darkEndPoints(Size size) => [
      _fromRelative(size, 0, 0.5),
      _fromRelative(size, 0.24, 0.4),
      _fromRelative(size, 0.63, 0.8),
      _fromRelative(size, 0.9, 1),
    ];

Offset _fromRelative(Size size, double dx, double dy) =>
    Offset(dx * size.width, dy * size.height);

class Slide extends StatelessWidget {
  const Slide({
    Key key,
    @required this.child,
    this.colors = const [Color(0xFF5C4297), Color(0xFF9988F1)],
  }) : super(key: key);

  final Widget child;

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
          stops: [0.2, 1.0],
        ),
      ),
      child: child,
    );
  }
}
