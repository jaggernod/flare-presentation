import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/credits.dart';
import 'package:flutter_app/pages/explore.dart';
import 'package:flutter_app/pages/filip.dart';
import 'package:flutter_app/pages/flare_info.dart';
import 'package:flutter_app/pages/flare_logo.dart';
import 'package:flutter_app/pages/focused_text.dart';
import 'package:flutter_app/pages/groke.dart';
import 'package:flutter_app/pages/summary/summary.dart';
import 'package:flutter_app/pages/teddy/teddy.dart';
import 'package:flutter_app/pages/web_tool.dart';
import 'package:flutter_app/slide.dart';
import 'package:presentation/presentation.dart';

class Pager extends StatefulWidget {
  const Pager({Key key}) : super(key: key);

  @override
  _PagerState createState() => _PagerState();
}

class _PagerState extends State<Pager> {
  PageController _controller;
  PresentationController _presentationController;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _presentationController = PresentationController(controller: _controller);
  }

  @override
  Widget build(BuildContext context) {
    final content = [
      const FlareLogo(),
      const FlareInfo(),
      const Filip(),
      const FocusedText(text: 'Confession'),
      const Groke(),
      const WebTool(),
      const Teddy(),
      const Explore(),
      const Summary(),
      const Credits(),
      const FocusedText(text: 'Questions?'),
    ];

    return Presentation(
      controller: _controller,
      presentationController: _presentationController,
      children: content.map((item) => Slide(child: item)).toList(),
    );
  }

  @override
  void dispose() {
    _presentationController.dispose();
    _controller.dispose();
    super.dispose();
  }
}
