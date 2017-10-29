import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:math' as math;

class CountdownClock extends AnimatedWidget {
  CountdownClock({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return new CustomPaint(
          size: new Size(400.0, 400.0),
          painter: new CountdownClockPainter(animation.value),
        );

    // return new Transform.rotate(
    //     angle: animation.value * math.PI / 180.0,
    //     origin: new Offset(200.0, 200.0),
    //     child: new CustomPaint(
    //       size: new Size(400.0, 400.0),
    //       painter: new CountdownClockPainter(animation.value),
    //     ));
  }
}

class ClockPage extends StatefulWidget {
  const ClockPage(this.title);

  final String title;

  @override
  _ClockPageState createState() => new _ClockPageState();
}

class _ClockPageState extends State<ClockPage> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 30),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
        child: new Center(
          child: new CountdownClock(
              animation:
                  new Tween(begin: 0.0, end: 360.0).animate(_controller)),
        ),
      ),
    );
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CountdownClockPainter extends CustomPainter {
  const CountdownClockPainter(this.animationValue);

  final double animationValue;

  void paint(Canvas canvas, Size size) {
    // need to separate animated and non-animated components

    final Offset center = new Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(
        center,
        200.0,
        new Paint()
          ..color = Colors.blueGrey
          ..style = PaintingStyle.fill);

    Path pointer = new Path()
      ..moveTo(0.0, 0.0)
      ..addArc(new Rect.fromLTRB(-10.0, -10.0, 10.0, 10.0),
          30 * math.PI / 180, 300 * math.PI / 180)
      ..moveTo(0.0, 0.0)
      ..addPolygon([
        new Offset(0.0, 0.0),
        new Offset(0.0, -150.0),
        new Offset(10.0, 150.0)
      ], true)
      ..moveTo(0.0, 0.0)
      ..addPolygon([
        new Offset(0.0, 0.0),
        new Offset(0.0, -150.0),
        new Offset(-10.0, 150.0)
      ], true);

    canvas.drawPath(
        pointer,
        new Paint()
          ..color = Colors.lightBlue
          ..style = PaintingStyle.fill);

  }

  bool shouldRepaint(CountdownClockPainter old) => false;
}
