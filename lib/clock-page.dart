import 'package:flutter/material.dart';
import 'package:flutter_playground/widgets/countdownclock.dart';


class ClockPage extends StatefulWidget {
  const ClockPage(this.title);

  final String title;

  _ClockPageState createState() => new _ClockPageState();
}

class _ClockPageState extends State<ClockPage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;

  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 30),
    );
    animation = new Tween(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
        child: new Center(
          child: new CountdownClock(
              animation: animation
          )
        ),
      ),
    );
  }

  dispose() {
    _controller.dispose();
    super.dispose();
  }
}