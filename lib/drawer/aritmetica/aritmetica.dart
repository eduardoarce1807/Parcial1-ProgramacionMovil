import 'package:parcial_1/drawer/CommonDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parcial_1/drawer/decimal/any_base.dart';

class EstructuraAritmetica extends StatefulWidget {
  static String ruta = "/aritmetica";

  @override
  State<StatefulWidget> createState() {
    return _EstructuraAritmetica();
  }
}

class _EstructuraAritmetica extends State<EstructuraAritmetica> {
  String dp1 = '+';

  TextEditingController inp1 = new TextEditingController();
  TextEditingController inp2 = new TextEditingController();
  TextEditingController inp3 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Operaciones Aritméticas"),
      ),
      drawer: CommonDrawer.obtenerDrawer(context),
      body: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Calculadora de operaciones aritméticas de números binarios.",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 30),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                          child: TextField(
                              controller: inp1,
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                  labelText: "", border: OutlineInputBorder()),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ]
                              // Only numbers can be entered
                              )),
                      const SizedBox(width: 30),
                      DropdownButton<String>(
                        value: dp1,
                        iconSize: 0,
                        elevation: 20,
                        underline: Container(
                          height: 1,
                          color: Colors.lightBlue,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dp1 = newValue!;
                          });
                        },
                        items: <String>['+', '-']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 24),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(width: 30),
                      Flexible(
                          child: TextField(
                              controller: inp2,
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                  labelText: "", border: OutlineInputBorder()),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ] // Only numbers can be entered
                              )),
                    ]),
                const SizedBox(height: 20),
                TextField(
                  enableInteractiveSelection:
                      false, // will disable paste operation
                  focusNode: new AlwaysDisabledFocusNode(),
                  controller: inp3,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(labelText: "Resultado (decimal)"),
                  // Only numbers can be entered
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF0D47A1),
                                Color(0xFF1976D2),
                                Color(0xFF42A5F5),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          child: const Text('Calcular'),
                          //Verificar tipo de operacion
                          onPressed: () {
                            try {
                              const bin2dec = AnyBase(AnyBase.bin, AnyBase.dec);
                              int int1 = int.parse(bin2dec.convert(inp1.text));
                              int int2 = int.parse(bin2dec.convert(inp2.text));

                              //Tipo de operacion
                              if (dp1 == '+') {
                                int answ = int1 + int2;
                                inp3.text = answ.toString();
                              }
                              if (dp1 == '-') {
                                int answ = int1 - int2;
                                inp3.text = answ.toString();
                              }
                            } catch (e) {
                              error(context);
                              inp1.text = '';
                              inp2.text = '';
                              inp3.text = '';
                            }
                          })
                    ],
                  ),
                ),
              ])),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

void error(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text('Ingrese valores válidos para el cálculo.'),
      );
    },
  );
}
