import 'package:flutter/material.dart';

showAlert(
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
            FlutterLogo(
              size: 100.0,
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('cancelar'),
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Ok'),
          )
        ],
      );
    },
  );
}
