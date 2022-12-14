import 'package:flutter/material.dart';
import 'equipos/registrarEquipo.dart';
import 'operation.dart';
import 'equipos/registrarEquipo.dart';
import 'equipos/elegirEquipo.dart';


class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      ElevatedButton(
        style: style,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => RegistrarEquipo()));
        },
        child: const Text('Registrar equipo'),
      ),
      const SizedBox(height: 15),
      ElevatedButton(
        style: style,
        onPressed: () {
           Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => elegirEquipo()));
        },
        child: const Text('Registrar jugador'),
      ),
    ]));
  }
}
