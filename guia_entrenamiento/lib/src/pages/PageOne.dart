import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  PageOne() : super();
  final String title = "DropDown Demo";
  @override
  PageOneState createState() => PageOneState();
}

class PageOneState extends State<PageOne> {
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 150,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Guía digital de entrenamiento físico",
              style: TextStyle(
                  height: 1,
                  fontSize: 30,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50.0,
            ),
            IconButton(
              icon: Image.asset('assets/images/login1.png'),
              iconSize: 50,
              onPressed: () {
                _nextPage(context);
              },
            ),
            IconButton(
              icon: Image.asset('assets/images/login2.jpg'),
              iconSize: 35,
              onPressed: () {
                _nextPage(context);
              },
            ),
            // Text('Selected: ${_selectedUnit.name}'),
            //const SizedBox(height: 30),
          ],
        ),
      ),
    ));
  }

  _nextPage(BuildContext context) {
    // final route = MaterialPageRoute(builder: (BuildContext context) {
    //   return PageTwo();
    // });
    // Navigator.of(context).push(route);
    Navigator.pushNamed(context, 'two');
  }
}
