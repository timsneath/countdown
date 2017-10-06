import 'package:flutter/material.dart';

class LettersPage extends StatefulWidget {
  const LettersPage(this.title);

  final String title;

  @override
  _LettersPageState createState() => new _LettersPageState();
}

class _LettersPageState extends State<LettersPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            _letterTilesComposer(),
          ],
        ),
      ),
    );
  }

  Widget _letterTilesComposer() {
    return new Container(
      margin: const EdgeInsets.all(8.0),
      child: new ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          const Text('A'),
          const Text('B'),
          const Text('C'),
          const Text('D'),
          const Text('E'),
          const Text('F'),
          const Text('G'),
          const Text('H'),
          const Text('I'),
        ],
      )
    );
  }
}