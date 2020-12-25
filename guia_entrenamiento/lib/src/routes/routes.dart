import 'package:flutter/material.dart';
import 'package:guia_entrenamiento/src/pages/PageOne.dart';
import 'package:guia_entrenamiento/src/pages/PageTwo.dart';
import 'package:guia_entrenamiento/src/pages/PageTrhee.dart';
import 'package:guia_entrenamiento/src/pages/PageFour.dart';
import 'package:guia_entrenamiento/src/pages/PageFive.dart';
import 'package:guia_entrenamiento/src/pages/PageSix.dart';
import 'package:guia_entrenamiento/src/pages/final_user_page.dart';
import 'package:guia_entrenamiento/src/pages/PageMacrociclo.dart';
import 'package:guia_entrenamiento/src/pages/PageMesociclo.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => PageOne(),
    'two': (BuildContext context) => PageTwo(),
    'trhee': (BuildContext context) => PageTrhee(),
    'four': (BuildContext context) => PageFour(),
    'five': (BuildContext context) => PageFive(),
    'six': (BuildContext context) => PageSix(),
    'final': (BuildContext context) => FinalUserPage(),
    'macrociclo': (BuildContext context) => MacrocicloPage(),
    'mesociclo': (BuildContext context) => MesocicloPage(),
  };
}
