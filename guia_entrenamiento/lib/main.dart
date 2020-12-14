import 'package:flutter/material.dart';
import 'package:guia_entrenamiento/PageTrhee.dart';
import 'PageOne.dart';
import 'PageTwo.dart';
import 'PageTrhee.dart';
import 'PageFour.dart';
import 'PageFive.dart';
import 'PageSix.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: PageOne(),
      //home: PageTrhee(),
      //home: PageOne(),
      home: PageOne(),
      //home: PageSix(),
    );
  }
}
