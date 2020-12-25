import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  final String route;
  final bool alert;
  final String title;
  final String text;
  FloatingButton(
      {@required this.route, @required this.alert, this.title, this.text});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.arrow_forward_ios),
      backgroundColor: Colors.black,
      onPressed: (alert)
          ? () => showAlert(context: context, title: title, text: text)
          : () => Navigator.pushNamed(context, route),
    );
  }

  void showAlert(
      {@required BuildContext context,
      @required String title,
      @required String text}) {
    showDialog(
      context: context,
      barrierDismissible:
          true, // para salir de la alerta haciendo tap afuera de ella
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(text),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Ok'),
            )
          ],
        );
      },
    );
  }
}
