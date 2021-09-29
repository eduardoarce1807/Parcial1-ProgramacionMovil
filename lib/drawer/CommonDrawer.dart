import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:parcial_1/drawer/home/home.dart';
import 'package:parcial_1/drawer/decimal/decimal.dart';
import 'package:parcial_1/drawer/aritmetica/aritmetica.dart';
import 'package:parcial_1/drawer/logica/logica.dart';

import 'package:flutter/material.dart';

class CommonDrawer {
  static ListTile obtenerElemento(
      Icon icono, String nombre, String ruta, BuildContext bContext) {
    return ListTile(
      leading: icono,
      title: Text(nombre),
      onTap: () {
        Navigator.pushNamed(bContext, ruta);
      },
    );
  }

  static Drawer obtenerDrawer(BuildContext contexto) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text("Parcial 1 - Eduardo Arce"),
            accountEmail: Text("eduardo.arce1807@gmail.com"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/pi.jpg"),
                    fit: BoxFit.cover)),
          ),
          obtenerElemento(
              Icon(TablerIcons.home), "Home", HomeDrawer.ruta, contexto),
          obtenerElemento(Icon(TablerIcons.square_plus), "Decimal",
              EstructuraDecimal.ruta, contexto),
          obtenerElemento(Icon(TablerIcons.circle_minus), "Aritmética",
              EstructuraAritmetica.ruta, contexto),
          obtenerElemento(
              Icon(TablerIcons.box), "Lógica", EstructuraLogica.ruta, contexto),
        ],
      ),
    );
  }
}
