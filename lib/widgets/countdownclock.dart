import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';

class CountdownClock extends AnimatedWidget {
  CountdownClock({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return new CustomPaint(
      size: new Size(300.0, 300.0),
      painter: new CountdownClockPainter(animation.value),
    );
  }
}

class CountdownClockPainter extends CustomPainter {
  const CountdownClockPainter(this.animationValue);

  final animationValue;

  @override
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
    ..strokeWidth = 4.0
    ..color = Colors.red;
    canvas.drawLine(center, center + _getPosition(animationValue), paint);
  }

  bool shouldRepaint(CountdownClockPainter old) => old.animationValue != animationValue;

  Offset _getPosition(double degree) {
    final radians = -math.pi * degree / 180 - math.pi;
    return new Offset(150.0 * math.sin(radians), 150.0 * math.cos(radians));
  }
}
