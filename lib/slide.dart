import 'package:flutter/material.dart';
import 'package:flutter_app/wave/wave_clipper.dart';

class Slide extends StatelessWidget {
  const Slide({
    Key key,
    @required this.child,
    this.colors = const [Color(0xFF5C4297), Color(0xFF9988F1)],
  }) : super(key: key);

  final Widget child;

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return DemoPage();
  }
}

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 120),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomPaint(
            painter: WavePainter(enable: true),
            child: ClipPath(
              clipper: WaveClipper(),
              child: Opacity(
                opacity: 0.4,
                child: Container(
                  color: Colors.deepPurple,
                  height: 175,
                  width: double.infinity,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
//
//class DemoBody extends StatefulWidget {
//  DemoBody(
//      {Key key, @required this.size, this.xOffset, this.yOffset, this.color})
//      : super(key: key);
//
//  final Size size;
//  final int xOffset;
//  final int yOffset;
//  final Color color;
//
//  @override
//  State<StatefulWidget> createState() {
//    return _DemoBodyState();
//  }
//}
//
//class _DemoBodyState extends State<DemoBody> with TickerProviderStateMixin {
//  AnimationController animationController;
//  List<Offset> animList1 = [];
//
//  @override
//  void initState() {
//    super.initState();
//
//    animationController =
//        AnimationController(vsync: this, duration: Duration(seconds: 2));
//
//    animationController.addListener(() {
//      animList1.clear();
//      for (int i = -2 - widget.xOffset;
//          i <= widget.size.width.toInt() + 2;
//          i++) {
//        animList1.add(Offset(
//            i.toDouble() + widget.xOffset,
//            sin((animationController.value * 360 - i) %
//                        360 *
//                        Vector.degrees2Radians) *
//                    20 +
//                50 +
//                widget.yOffset));
//      }
//    });
//    animationController.repeat();
//  }
//
//  @override
//  void dispose() {
//    animationController.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      alignment: Alignment.center,
//      child: AnimatedBuilder(
//        animation: CurvedAnimation(
//          parent: animationController,
//          curve: Curves.easeInOut,
//        ),
//        builder: (context, child) => ClipPath(
//          child: widget.color == null
//              ? Image.asset(
//                  'images/demo5bg.jpg',
//                  width: widget.size.width,
//                  height: widget.size.height,
//                  fit: BoxFit.cover,
//                )
//              : Container(
//                  width: widget.size.width,
//                  height: widget.size.height,
//                  color: widget.color,
//                ),
//          clipper: WaveClipper(animationController.value, animList1),
//        ),
//      ),
//    );
//  }
//}

class UnifiedSlide extends StatelessWidget {
  const UnifiedSlide({
    Key key,
    @required this.child,
    this.colors = const [Color(0xFF5C4297), Color(0xFF9988F1)],
  }) : super(key: key);

  final Widget child;

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
          stops: [0.2, 1.0],
        ),
      ),
      child: child,
    );
  }
}
