import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/pager.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

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
            fontSize: 32.0,
          ),
          caption: TextStyle(
            fontSize: 24.0,
            fontStyle: FontStyle.italic,
          ),
          subhead: TextStyle(
            fontSize: 24.0,
          ),
        ),
        fontFamily: 'Roboto',
      ),
      home: Material(child: const Pager()),
    );
  }
}
