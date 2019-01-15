import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/credits.dart';
import 'package:flutter_app/pages/filip.dart';
import 'package:flutter_app/pages/flare_info.dart';
import 'package:flutter_app/pages/flare_logo.dart';
import 'package:flutter_app/pages/focused_text.dart';
import 'package:flutter_app/pages/groke.dart';
import 'package:flutter_app/pages/plug.dart';
import 'package:flutter_app/pages/summary/summary.dart';
import 'package:flutter_app/slide.dart';

class Pager extends StatelessWidget {
  const Pager({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = [
      const FlareLogo(),
      const FlareInfo(),
      const Filip(),
      const FocusedText(text: 'Confession'),
      const Groke(),
      const Summary(),
      const Plug(),
      const Credits(),
      const FocusedText(text: 'Questions?'),
      // TODO Tools used, credits, shameless plug, screenshots of Flare Designer
    ];

    return PageView(
      children: content.map((item) => Slide(child: item)).toList(),
    );
  }
}
