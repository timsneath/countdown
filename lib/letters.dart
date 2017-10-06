import 'package:flutter/material.dart';

// for now, this is just a rough and ugly text
// we'll change it into a Scrabble tile effect soon
class LetterTile extends StatelessWidget {
  const LetterTile(this.letter);

  final String letter;

  Widget build(BuildContext context) => new Text(letter);
}


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
          new LetterTile('A'),
          new LetterTile('B'),
          new LetterTile('C'),
          new LetterTile('P'),
          new LetterTile('E'),
          new LetterTile('F'),
          new LetterTile('G'),
          new LetterTile('H'),
          new LetterTile('I'),
        ],
      )
    );
  }
}