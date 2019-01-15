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
      home: Material(child: const Presentation()),
    );
  }
}

class Presentation extends StatelessWidget {
  const Presentation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final queryData = MediaQuery.of(context);
    double devicePixelRatio = queryData.devicePixelRatio;

    return Theme(
      data: Theme.of(context).copyWith(
        primaryTextTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 100.0 / devicePixelRatio,
          ),
          caption: TextStyle(
            fontSize: 70.0 / devicePixelRatio,
            fontStyle: FontStyle.italic,
          ),
          subhead: TextStyle(
            fontSize: 70.0 / devicePixelRatio,
          ),
        ),
      ),
      child: Pager(),
    );
  }
}
