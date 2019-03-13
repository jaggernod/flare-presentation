import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Credits extends StatelessWidget {
  const Credits({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(48.0),
      child: Center(
        child: QrImage(
          data: 'https://github.com/jaggernod/flare-presentation',
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
