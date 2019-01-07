import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/groke.dart';
import 'package:flutter_app/slide.dart';

class Pager extends StatelessWidget {
  const Pager({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Slide(child: _buildFlareLogo(context)),
        Slide(child: const Groke()),
        Slide(child: _buildFlutterQuestion(context)),
      ],
    );
  }

  Widget _buildFlutterQuestion(BuildContext context) {
    final queryData = MediaQuery.of(context);
    double devicePixelRatio = queryData.devicePixelRatio;

    return Padding(
      padding: EdgeInsets.all(48.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What is Flutter?',
            style: Theme.of(context)
                .primaryTextTheme
                .title
                .copyWith(fontSize: 70 / devicePixelRatio),
          ),
          Expanded(
            child: Center(
              child: Text(
                '“Flutter is Google’s mobile app SDK for crafting high-quality $devicePixelRatio'
                    'native interfaces on iOS and Android in record time.'
                    '\nFlutter works with existing code, is used by developers '
                    'and organizations around the world, and is free and open source.”',
                style: Theme.of(context)
                    .primaryTextTheme
                    .caption
                    .copyWith(fontSize: 60 / devicePixelRatio),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlareLogo(BuildContext context) {
    return FlareActor(
      'assets/flare_logo.flr',
      alignment: Alignment.center,
      fit: BoxFit.contain,
      animation: 'Build and Fade Out',
    );
  }
}
