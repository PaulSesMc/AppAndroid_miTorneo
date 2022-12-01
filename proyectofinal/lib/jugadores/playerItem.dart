import 'package:flutter/material.dart';
import 'package:proyectofinal/operation.dart';
//import 'registrarEquipo.dart';
import '../equipos/teamInfo.dart';

import 'player.dart';

class playerItem extends StatelessWidget {
  const playerItem({super.key, required this.item});

  final Player item;

  Widget build(BuildContext context) {
    var puntospp = item.puntos / item.juegos_jugados;
    var asistenciaspp = item.asistencias / item.juegos_jugados;
    puntospp = double.parse((puntospp).toStringAsFixed(1));
    asistenciaspp = double.parse((asistenciaspp).toStringAsFixed(1));
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          elevation: 5,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.nombre,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Numero :${this.item.numero}"),
                            Text("Edad:${this.item.edad}"),
                          ],
                        ))),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            /*Text('Estadísticas',
                                style: TextStyle(fontWeight: FontWeight.bold)),*/
                            Text("Puntos: ${puntospp}"),
                            Text("Asistencias: ${asistenciaspp}"),
                          ],
                        )))
              ]),
        ));
  }
}
