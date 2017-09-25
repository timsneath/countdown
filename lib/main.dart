import 'package:flutter/material.dart';
import 'package:flutter_playground/homepage.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  Route<Null> _getRoute(RouteSettings settings) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Playground',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/':  (BuildContext context) => new MyHomePage("DemoMainMenu")
      },
      onGenerateRoute: _getRoute,
    );
  }
}

