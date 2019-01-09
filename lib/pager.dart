import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/filip.dart';
import 'package:flutter_app/pages/flare_info.dart';
import 'package:flutter_app/pages/flare_logo.dart';
import 'package:flutter_app/pages/groke.dart';
import 'package:flutter_app/slide.dart';

class Pager extends StatelessWidget {
  const Pager({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = [
      const FlareLogo(),
      const FlareInfo(),
      const Filip(),
      const Groke(),
    ];

    return PageView(
      children: content.map((item) => Slide(child: item)).toList(),
    );
  }
}
