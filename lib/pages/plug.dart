import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

const _images = [
  'https://lh3.googleusercontent.com/0-s--NnwAcjWeVNeurBU6_lw_vL3U_iGmyhchKHncq7g06cC87GUmnn-a_pSA0u5x-5B=w3200-h1576-rw',
  'https://lh3.googleusercontent.com/K3tjDN1bAdj4A8pXbe9JMSi_M4aqlw5vm_RKbcybDYuMIafcN6b61m9-5ky4S53Ynvg=w3200-h1576-rw',
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
          children: List.of(_images.map((url) => Image.network(url)).toList())
            ..add(Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
