import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Clock extends AnimatedWidget {
  Clock({Key key, this.animation}) : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
      size: new Size(400.0, 400.0),
      painter: new ClockPainter(),
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
      duration: new Duration(seconds: 10), // currently ticks for ten seconds
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
          child: new Clock(animation: new StepTween(begin: 0, end: 1000).animate(_controller)),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final DateTime currentTime = new DateTime.now();

  @override
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
            text: currentTime.toString(),
            style: new TextStyle(color: Colors.white70)),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    painter.layout();
    var timeOffset = new Offset(center.dx - painter.width / 2, center.dy);
    painter.paint(canvas, timeOffset);
  }

  @override
  bool shouldRepaint(ClockPainter old) => true;
    // return new DateTime.now().difference(old.currentTime) >
    //     new Duration(milliseconds: 500);
    // }
}
