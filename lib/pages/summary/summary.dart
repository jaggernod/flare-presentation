import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/summary/bad.dart';
import 'package:flutter_app/pages/summary/good.dart';
import 'package:flutter_app/pages/summary/ugly.dart';

const List<Widget> _traits = const [
  Good(),
  Bad(),
  Ugly(),
];

class Summary extends StatefulWidget {
  const Summary({
    Key key,
  }) : super(key: key);

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  PageController _controller;

  @override
  void initState() {
    super.initState();

    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: _ProgressIndicator(
            controller: _controller,
            count: 3,
          ),
        ),
        Expanded(
          child: PageView(
            pageSnapping: true,
            controller: _controller,
            scrollDirection: Axis.vertical,
            children: _traits.map((trait) => _Trait(child: trait)).toList(),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}

class _Trait extends StatelessWidget {
  const _Trait({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: child,
      ),
    );
  }
}

const _indicatorSize = 48.0;

class _Indicator extends StatelessWidget {
  const _Indicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _indicatorSize,
      height: _indicatorSize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blueGrey,
      ),
    );
  }
}

class _ProgressIndicator extends StatefulWidget {
  const _ProgressIndicator({
    Key key,
    this.count,
    this.controller,
  }) : super(key: key);

  final int count;

  final PageController controller;

  @override
  _ProgressIndicatorState createState() => _ProgressIndicatorState();
}

class _ProgressIndicatorState extends State<_ProgressIndicator> {
  double _pagePosition;

  VoidCallback listener;

  @override
  void initState() {
    super.initState();

    _pagePosition = 0;

    listener = () {
      if (!mounted) {
        return;
      }
      setState(() {
        _pagePosition = widget.controller.page;
      });
    };

    widget.controller.addListener(listener);
  }

  @override
  void didUpdateWidget(_ProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      widget.controller.addListener(listener);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> indicators = _buildIndicators(widget.count);

    return Stack(
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: indicators),
        Positioned(
          top: _pagePosition * _indicatorSize * 2,
          child: Container(
            width: _indicatorSize,
            height: _indicatorSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF00419E).withOpacity(0.7),
            ),
            child: Transform.rotate(
              angle: pi * _pagePosition,
              child: FlutterLogo(
                size: 36,
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildIndicators(int count) {
    final indicators = <Widget>[];

    for (int i = 0; i < count; ++i) {
      indicators.add(const _Indicator());
      if (i + 1 != count) {
        indicators.add(const SizedBox(height: _indicatorSize));
      }
    }
    return indicators;
  }
}
