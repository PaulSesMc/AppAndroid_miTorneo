import 'package:flutter/material.dart';
import 'package:proyectofinal/operation.dart';
import 'registrarEquipo.dart';
import 'teamInfo.dart';

import 'team.dart';

class TeamItem extends StatelessWidget {
  const TeamItem({super.key, required this.item});

  final Team item;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          elevation: 5,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TeamInfo(item: item)));
                  },
                  child: Image.network(
                    this.item.logo,
                    width: 200,
                  ),
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.nombre,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                                "Record:${this.item.juegos_ganados} - ${this.item.juegos_perdidos}"),
                          ],
                        )))
              ]),
        ));
  }
}
