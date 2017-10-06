import 'package:flutter/material.dart';
import 'package:flutter_playground/homepage.dart';
import 'package:flutter_playground/clock.dart';
import 'package:flutter_playground/letters.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  // Route<Null> _getRoute(RouteSettings settings) {
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Playground',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/':        (BuildContext context) => new MyHomePage("Demo List"),
        '/clock':   (BuildContext context) => new ClockPage("Clock"),
        '/letters': (BuildContext context) => new LettersPage("Letters")
      },
      // onGenerateRoute: _getRoute,
    );
  }
}

