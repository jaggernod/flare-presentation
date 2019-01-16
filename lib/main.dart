import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/pager.dart';

double fontScaleFactor = 1.0;

void main() {
  if (!Platform.isAndroid) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
    fontScaleFactor = 1.5;
  }

  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(PresentationApp());
}

class PresentationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flare Presentation',
      theme: ThemeData(
        primaryTextTheme: TextTheme(
          title: TextStyle(
            fontSize: 32.0 * fontScaleFactor,
          ),
          caption: TextStyle(
            fontSize: 24.0 * fontScaleFactor,
            fontStyle: FontStyle.italic,
          ),
          subhead: TextStyle(
            fontSize: 24.0 * fontScaleFactor,
          ),
        ),
        fontFamily: 'Roboto',
      ),
      home: Material(child: const Pager()),
    );
  }
}
