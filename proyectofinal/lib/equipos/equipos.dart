import 'package:flutter/material.dart';
import 'package:proyectofinal/jugadores/player.dart';
import 'team.dart';
import 'teamList.dart';
import '../operation.dart';
import 'package:proyectofinal/jugadores/playerList.dart';
import 'package:proyectofinal/jugadores/playerItem.dart';


class Equipos extends StatelessWidget {
  final Future<List<Team>> products = fetchTeam();
  final Future<List<Player>> products2 = fetchJugadorEquipo(1);

  @override
  Widget build(BuildContext context) {
    Key k = new Key("");
    return Scaffold(
        body: Center(
      child: FutureBuilder<List<Player>>(
        future: products2,
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? playerList(items: snapshot.data!, key: k)
              : Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}
