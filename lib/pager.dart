import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/filip.dart';
import 'package:flutter_app/pages/flare_info.dart';
import 'package:flutter_app/pages/flare_logo.dart';
import 'package:flutter_app/pages/focused_text.dart';
import 'package:flutter_app/pages/groke.dart';
import 'package:flutter_app/pages/magic_behind.dart';
import 'package:flutter_app/pages/summary.dart';
import 'package:flutter_app/slide.dart';

class Pager extends StatelessWidget {
  const Pager({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = [
      const FlareLogo(),
      const FlareInfo(),
      const Filip(),
      const MagicBehindFilip(),
      const FocusedText(text: 'Confession'),
      const Groke(),
      const Summary(),
      const FocusedText(text: 'Questions?'),
    ];

    return PageView(
      children: content.map((item) => Slide(child: item)).toList(),
    );
  }
}
