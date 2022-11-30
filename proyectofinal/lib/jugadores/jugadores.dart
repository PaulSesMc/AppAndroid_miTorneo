import 'package:flutter/material.dart';
import 'package:proyectofinal/equipos/team.dart';
import 'package:proyectofinal/jugadores/player.dart';
import 'player.dart';
import 'playerList.dart';
import '../operation.dart';
import 'package:proyectofinal/jugadores/playerList.dart';
import 'package:proyectofinal/jugadores/playerItem.dart';

class Jugadores extends StatelessWidget {
  Jugadores({super.key, required this.item});

  final Team item;

  @override
  Widget build(BuildContext context) {
    final Future<List<Player>> products = fetchJugadorEquipo(item.id_equipo);
    Key k = new Key("");
    return MaterialApp(
        title: "Jugadores",
        home: Scaffold(
            appBar: AppBar(
                title: const Text("Jugadores"),
                backgroundColor: Color.fromARGB(255, 235, 133, 0),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  //replace with our own icon data.
                )),
            body: FutureBuilder<List<Player>>(
              future: products,
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? playerList(items: snapshot.data!, key: k)
                    : Center(child: CircularProgressIndicator());
              },
            )));
  }
}
