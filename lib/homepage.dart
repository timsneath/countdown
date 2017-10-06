import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage(this.title);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _onClockDemoPressed() {
    Navigator.of(context).pushNamed('/clock');
  }

  void _onLettersDemoPressed() {
    Navigator.of(context).pushNamed('/letters');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // ugly but functional
            
            new RaisedButton(
              child: new Text(
                'Clock Demo'
              ),
              onPressed: _onClockDemoPressed,
            ),
            new RaisedButton(
              child: new Text(
                'Letters Demo'
              ),
              onPressed: _onLettersDemoPressed,
            )
          ],
        ),
      ),
    );
  }
}