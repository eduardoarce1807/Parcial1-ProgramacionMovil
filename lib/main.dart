import 'package:parcial_1/drawer/home/home.dart';
import 'package:parcial_1/drawer/decimal/decimal.dart';
import 'package:parcial_1/drawer/aritmetica/aritmetica.dart';
import 'package:parcial_1/drawer/logica/logica.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        routes: {
          HomeDrawer.ruta: (BuildContext context) => HomeDrawer(),
          EstructuraDecimal.ruta: (BuildContext context) => EstructuraDecimal(),
          EstructuraAritmetica.ruta: (BuildContext context) =>
              EstructuraAritmetica(),
          EstructuraLogica.ruta: (BuildContext context) => EstructuraLogica(),
        });
  }
}
