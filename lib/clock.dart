import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ClockControl extends AnimatedWidget {
  ClockControl({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new CustomPaint(
      size: new Size(400.0, 400.0),
      painter: new ClockPainter(animation.value),
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
          child: new ClockControl(
              animation:
                  new Tween(begin: 0.0, end: 180.0).animate(_controller)),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  const ClockPainter(this.animationValue);

  final double animationValue;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = new Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(
        center,
        200.0,
        new Paint()
          ..color = Colors.blueGrey
          ..style = PaintingStyle.fill);

    final DateTime currentTime = new DateTime.now();

    var painter = new TextPainter(
        text: new TextSpan(
            text: animationValue.round().toString(),
            // text: currentTime.toString(),
            style: new TextStyle(color: Colors.white70)),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    painter.layout();
    var timeOffset = new Offset(center.dx - painter.width / 2, center.dy);
    painter.paint(canvas, timeOffset);
  }

  @override
  bool shouldRepaint(ClockPainter old) => true;
  // new DateTime.now().difference(old.currentTime) >
  // new Duration(milliseconds: 500);
}
