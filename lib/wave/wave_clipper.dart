import 'dart:ui';

import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => _backgroundPath(size);

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  Path _backgroundPath(Size size) => _createWaveClipperPath(size)
    ..relativeLineTo(0, size.height)
    ..lineTo(0, size.height)
    ..close();
}

Path _createWaveClipperPath(Size size) {
  final endPoints = _endPoints(size);
  final controlPoint = _controlPoints(size);

  Path path = Path();
  path.moveTo(endPoints[0].dx, endPoints[0].dy);

  for (var i = 0; i < endPoints.length; i++) {
    path.quadraticBezierTo(controlPoint[i].dx, controlPoint[i].dy,
        endPoints[i].dx, endPoints[i].dy);
  }

  return path;
}

List<Offset> _controlPoints(Size size) {
  return [
    _fromRelative(size, 0.12, 0.1),
    _fromRelative(size, 0.12, 0.1),
    _fromRelative(size, 0.47, 1),
    _fromRelative(size, 0.75, 0.7),
  ];
}

List<Offset> _endPoints(Size size) {
  return [
    _fromRelative(size, 0, 0.5),
    _fromRelative(size, 0.24, 0.4),
    _fromRelative(size, 0.63, 0.8),
    _fromRelative(size, 0.9, 1),
  ];
}

Offset _fromRelative(Size size, double dx, double dy) =>
    Offset(dx * size.width, dy * size.height);

class WavePainter extends CustomPainter {
  WavePainter({this.enable = true})
      : controlPaint = Paint()
          ..color = Colors.red
          ..style = PaintingStyle.fill,
        endPaint = Paint()
          ..color = Colors.blue
          ..style = PaintingStyle.fill;

  final bool enable;
  final Paint controlPaint;
  final Paint endPaint;

  @override
  void paint(Canvas canvas, Size size) {
    if (!enable) {
      return;
    }
    for (var control in _controlPoints(size)) {
      canvas.drawCircle(control, 4, controlPaint);
    }
    for (var endPoint in _endPoints(size)) {
      canvas.drawCircle(endPoint, 4, endPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => enable;
}
