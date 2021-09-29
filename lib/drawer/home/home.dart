import 'package:parcial_1/drawer/CommonDrawer.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatefulWidget {
  static String ruta = "/";

  @override
  State<StatefulWidget> createState() {
    return _HomeDrawer();
  }
}

class _HomeDrawer extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        drawer: CommonDrawer.obtenerDrawer(context),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.black12,
              Colors.black54,
            ]),
          ),
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/math.jpg'),
              ),
              Container(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Examen Parcial 1',
                      style: TextStyle(fontSize: 28.0, color: Colors.white),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Esta aplicación puede convertir números del sistema decimal, binario, octal y hexadecimal entre sí.',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    Text(
                      'También puede resolver operaciones aritméticas (suma y resta) entre números binarios.',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    Text(
                      'Por último también permite realizar operaciones lógicas (AND, OR y XOR) entre números binarios.',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Eduardo Antonio Arce Saavedra.',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
