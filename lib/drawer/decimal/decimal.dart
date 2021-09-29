import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:parcial_1/drawer/CommonDrawer.dart';
import 'package:flutter/material.dart';
import 'package:parcial_1/drawer/decimal/any_base.dart';
import 'package:parcial_1/drawer/decimal/conversor.dart';

class EstructuraDecimal extends StatefulWidget {
  static String ruta = "/decimal";

  @override
  State<StatefulWidget> createState() {
    return _EstructuraDecimal();
  }
}

class _EstructuraDecimal extends State<EstructuraDecimal> {
  String dp1 = 'Decimal';
  String dp2 = 'Binario';

  TextEditingController inp1 = new TextEditingController();
  TextEditingController inp2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Convertir Decimal"),
      ),
      drawer: CommonDrawer.obtenerDrawer(context),
      body: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Convertidor Sistema decimal a Binario, Octal y Hexadecimal (y viceversa).",
                style: TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DropdownButton<String>(
                    value: dp1,
                    iconSize: 20,
                    elevation: 20,
                    underline: Container(
                      height: 2,
                      color: Colors.lightBlue,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dp1 = newValue!;
                      });
                    },
                    items: <String>[
                      'Decimal',
                      'Binario',
                      'Octal',
                      'Hexadecimal'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    }).toList(),
                  ),
                  Icon(TablerIcons.arrow_right),
                  DropdownButton<String>(
                    value: dp2,
                    iconSize: 20,
                    elevation: 20,
                    underline: Container(
                      height: 2,
                      color: Colors.lightBlue,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dp2 = newValue!;
                      });
                    },
                    items: <String>[
                      'Decimal',
                      'Binario',
                      'Octal',
                      'Hexadecimal'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                      child: TextField(
                    controller: inp1,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                        labelText: "Número", border: OutlineInputBorder()),
                    // Only numbers can be entered
                  )),
                  Icon(TablerIcons.arrow_right),
                  Flexible(
                      child: TextField(
                    enableInteractiveSelection:
                        false, // will disable paste operation
                    focusNode: new AlwaysDisabledFocusNode(),
                    controller: inp2,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                        labelText: "Conversión", border: OutlineInputBorder()),
                    // Only numbers can be entered
                  )),
                ],
              ),
              const SizedBox(height: 30),
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
                      //Verificar tipo de operacion
                      onPressed: () {
                        //Prevenir errores con LowerCase
                        inp1.text = inp1.text.toUpperCase();

                        //AnyBase
                        const dec2bin = AnyBase(AnyBase.dec, AnyBase.bin);
                        const dec2oct = AnyBase(AnyBase.dec, AnyBase.oct);
                        const dec2hex = AnyBase(AnyBase.dec, AnyBase.hex);

                        const bin2dec = AnyBase(AnyBase.bin, AnyBase.dec);
                        const bin2oct = AnyBase(AnyBase.bin, AnyBase.oct);
                        const bin2hex = AnyBase(AnyBase.bin, AnyBase.hex);

                        const oct2dec = AnyBase(AnyBase.oct, AnyBase.dec);
                        const oct2bin = AnyBase(AnyBase.oct, AnyBase.bin);
                        const oct2hex = AnyBase(AnyBase.oct, AnyBase.hex);

                        const hex2dec = AnyBase(AnyBase.hex, AnyBase.dec);
                        const hex2bin = AnyBase(AnyBase.hex, AnyBase.bin);
                        const hex2oct = AnyBase(AnyBase.hex, AnyBase.oct);

                        try {
                          //Empieza en decimal
                          if (dp1 == 'Decimal' && dp2 == 'Binario') {
                            inp2.text = dec2bin.convert(inp1.text);
                          }
                          if (dp1 == 'Decimal' && dp2 == 'Octal') {
                            inp2.text = dec2oct.convert(inp1.text);
                          }
                          if (dp1 == 'Decimal' && dp2 == 'Hexadecimal') {
                            inp2.text = dec2hex.convert(inp1.text);
                          }

                          //Empieza en Binario
                          if (dp1 == 'Binario' && dp2 == 'Decimal') {
                            inp2.text = bin2dec.convert(inp1.text);
                          }
                          if (dp1 == 'Binario' && dp2 == 'Octal') {
                            inp2.text = bin2oct.convert(inp1.text);
                          }
                          if (dp1 == 'Binario' && dp2 == 'Hexadecimal') {
                            inp2.text = bin2hex.convert(inp1.text);
                          }

                          //Empieza en Octal
                          if (dp1 == 'Octal' && dp2 == 'Decimal') {
                            inp2.text = oct2dec.convert(inp1.text);
                          }
                          if (dp1 == 'Octal' && dp2 == 'Binario') {
                            inp2.text = oct2bin.convert(inp1.text);
                          }
                          if (dp1 == 'Octal' && dp2 == 'Hexadecimal') {
                            inp2.text = oct2hex.convert(inp1.text);
                          }

                          //Empieza en Hexa
                          if (dp1 == 'Hexadecimal' && dp2 == 'Decimal') {
                            inp2.text = hex2dec.convert(inp1.text);
                          }
                          if (dp1 == 'Hexadecimal' && dp2 == 'Binario') {
                            inp2.text = hex2bin.convert(inp1.text);
                          }
                          if (dp1 == 'Hexadecimal' && dp2 == 'Octal') {
                            inp2.text = hex2oct.convert(inp1.text);
                          }

                          //Misma operacion
                          if (dp1 == dp2) {
                            inp2.text = '';
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(
                                      'Por favor, seleccione una operación diferente.'),
                                );
                              },
                            );
                          }
                        } catch (e) {
                          error(context);
                        }
                      },
                      child: const Text('Calcular'),
                    ),
                  ],
                ),
              ),
            ],
          )),
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
        content: Text('Ingrese valores válidos para la conversión.'),
      );
    },
  );
}
