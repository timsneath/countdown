import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ClockPage extends StatefulWidget {
  const ClockPage(this.title);

  final String title;

  @override
  _ClockPageState createState() => new _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Container(
          height: 400.0,
          width: 400.0,
          decoration: new BoxDecoration(
              color: Colors.blueGrey, shape: BoxShape.circle),
          child: new Center(
            child: new Text(
              "${new DateTime.now()}",
              style: new TextStyle(color: Colors.white70)
            )
          ),
        ),
      ),
    );
  }
}
