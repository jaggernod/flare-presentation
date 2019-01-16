import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

const _images = [
  'assets/screenshot1.webp',
  'assets/screenshot2.webp',
];

class Plug extends StatelessWidget {
  const Plug({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.of(_images.map((it) => Image.asset(it)).toList())
            ..add(Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'earli',
                        style: Theme.of(context).primaryTextTheme.subhead,
                      ),
                      QrImage(
                        data:
                            'https://play.google.com/store/apps/details?id=de.axelspringer.yapa',
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            )),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              'assets/upday_app-icon_digital_blue.png',
              height: 24,
              width: 24,
            ),
          ),
        ),
      ],
    );
  }
}
