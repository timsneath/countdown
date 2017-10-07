import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CountdownClock extends AnimatedWidget {
  CountdownClock({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new CustomPaint(
      size: new Size(400.0, 400.0),
      painter: new CountdownClockPainter(animation.value),
    );
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
    final Offset center = new Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(
        center,
        200.0,
        new Paint()
          ..color = Colors.blueGrey
          ..style = PaintingStyle.fill);

    var painter = new TextPainter(
        text: new TextSpan(
            text: animationValue.toStringAsFixed(1),
            style: new TextStyle(color: Colors.white70, fontSize: 40.0)),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    painter.layout();
    var timeOffset = new Offset(
        center.dx - painter.width / 2, center.dy - painter.height / 2);
    painter.paint(canvas, timeOffset);
  }

  // right now we're just painting as often as called - is this bad?
  bool shouldRepaint(CountdownClockPainter old) => true;
  // new DateTime.now().difference(old.currentTime) >
  // new Duration(milliseconds: 500);
}
