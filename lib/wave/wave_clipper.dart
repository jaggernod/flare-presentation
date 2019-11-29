import 'dart:ui';

import 'package:flutter/material.dart';

typedef ToOffsets = List<Offset> Function(Size);

class WaveClipper extends CustomClipper<Path> {
  WaveClipper(
      {@required this.toControlPoints,
      @required this.toEndPoints,
      this.weight = 1,}) : assert(toControlPoints != null),
        assert(toEndPoints != null);

  final double weight;
  final ToOffsets toControlPoints;
  final ToOffsets toEndPoints;

  @override
  Path getClip(Size size) => _backgroundPath(size);

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  Path _backgroundPath(Size size) => _createWaveClipperPath(size, weight)
    ..relativeLineTo(0, size.height)
    ..lineTo(0, size.height)
    ..close();

  Path _createWaveClipperPath(Size size, double weight) {
    final endPoints = toEndPoints(size);
    final controlPoint = toControlPoints(size);

    Path path = Path();
    path.moveTo(endPoints[0].dx, endPoints[0].dy);

    for (var i = 0; i < endPoints.length; i++) {
      path.conicTo(
        controlPoint[i].dx,
        controlPoint[i].dy,
        endPoints[i].dx,
        endPoints[i].dy,
        weight,
      );
    }

    return path;
  }
}

class WavePainter extends CustomPainter {
  WavePainter({
    @required this.toControlPoints,
    @required this.toEndPoints,
    this.enable = true,
  })  : assert(toControlPoints != null),
        assert(toEndPoints != null),
        controlPaint = Paint()
          ..color = Colors.red
          ..style = PaintingStyle.fill,
        endPaint = Paint()
          ..color = Colors.blue
          ..style = PaintingStyle.fill;

  final ToOffsets toControlPoints;
  final ToOffsets toEndPoints;

  final bool enable;
  final Paint controlPaint;
  final Paint endPaint;

  @override
  void paint(Canvas canvas, Size size) {
    if (!enable) {
      return;
    }
    for (var control in toControlPoints(size)) {
      canvas.drawCircle(control, 4, controlPaint);
    }
    for (var endPoint in toEndPoints(size)) {
      canvas.drawCircle(endPoint, 4, endPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => enable;
}
