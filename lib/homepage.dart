import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage(this.title);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              child: new Text('CLOCK DEMO'),
              onPressed: () => Navigator.of(context).pushNamed('/clock'),
            ),
            new RaisedButton(
              child: new Text('LETTERS DEMO'),
              onPressed: () => Navigator.of(context).pushNamed('/letters'),
            )
          ],
        ),
      ),
    );
  }
}
