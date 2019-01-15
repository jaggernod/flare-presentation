import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const _images = [
  'https://lh3.googleusercontent.com/0-s--NnwAcjWeVNeurBU6_lw_vL3U_iGmyhchKHncq7g06cC87GUmnn-a_pSA0u5x-5B=w3200-h1576-rw',
  'https://lh3.googleusercontent.com/o-AlrtqrC3U2S751uvFH4P_yQwHdZFKusEfpL27se4fNNcqGsQkXtUFwUyp2DIrrK4XQ=w3200-h1576-rw',
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
          children: _images
              .map((url) => CachedNetworkImage(
                    imageUrl: url,
                    placeholder: CircularProgressIndicator(),
                    errorWidget: Icon(Icons.error),
                  ))
              .toList(),
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
