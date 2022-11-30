import 'package:flutter/material.dart';
import 'package:proyectofinal/operation.dart';
import 'registrarPartido.dart';

import 'partido.dart';

class PartidoItem extends StatelessWidget {
  const PartidoItem({super.key, required this.item});

  final Partido item;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          elevation: 5,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(children: [
                  Image.network(
                    this.item.logo_v,
                    width: 100,
                  ),
                  Text("${this.item.visitante}")
                ]),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.fecha_hora,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("${this.item.score_equipo_v}"),
                                  Text("-"),
                                  Text("${this.item.score_equipo_l}")
                                ]),
                          ],
                        ))),
                Column(children: [
                  Image.network(
                    this.item.logo_l,
                    width: 100,
                  ),
                  Text("${this.item.local}")
                ]),
              ]),
        ));
  }
}
