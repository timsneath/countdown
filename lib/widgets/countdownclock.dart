import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';

class CountdownClock extends AnimatedWidget {
  static final _doubleTween = new Tween<double>(begin: 0.0, end: 360.0);
  static final _colorTween =
      new ColorTween(begin: Colors.green, end: Colors.red);

  CountdownClock({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return new CustomPaint(
      size: new Size(300.0, 300.0),
      painter: new CountdownClockPainter(
          time: _doubleTween.evaluate(animation),
          color: _colorTween.evaluate(animation)),
    );
  }
}

class CountdownClockPainter extends CustomPainter {
  double time;
  Color color;

  CountdownClockPainter({this.time, this.color});

  void paint(Canvas canvas, Size size) {
    // do we need to separate animated and non-animated components?

    final Offset center = new Offset(size.width / 2, size.height / 2);

    final Paint paint = new Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blueGrey;
    canvas.drawCircle(center, 150.0, paint);

    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeWidth = 10.0;
    canvas.drawCircle(center, 150.0, paint);

    paint
      ..style = PaintingStyle.fill
      ..color = Colors.grey;
    canvas.drawCircle(center, 10.0, paint);

    paint
      ..style = PaintingStyle.fill
      ..strokeWidth = 8.0
      ..color = color;
    canvas.drawLine(center, center + _getPosition(time), paint);
  }

  bool shouldRepaint(CountdownClockPainter old) => old.time != time;

  Offset _getPosition(double degree) {
    final radians = -math.pi * degree / 180 - math.pi;
    return new Offset(150.0 * math.sin(radians), 150.0 * math.cos(radians));
  }
}
