import 'package:flutter/material.dart';
import 'package:proyectofinal/jugadores/player.dart';
import 'team.dart';
import 'teamList.dart';
import 'teamListPlayer.dart';

import '../operation.dart';
import 'package:proyectofinal/jugadores/playerList.dart';
import 'package:proyectofinal/jugadores/playerItem.dart';

class elegirEquipo extends StatelessWidget {
  final Future<List<Team>> products = fetchTeam();

  @override
  Widget build(BuildContext context) {
    Key k = new Key("");
    String _title = 'Selecciona equipo';

    return Scaffold(
      appBar: AppBar(
                title: Text(_title),
                backgroundColor: Color.fromARGB(255, 235, 133, 0),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                )),
        body: Center(
      child: FutureBuilder<List<Team>>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? teamListPlayer(items: snapshot.data!, key: k)
              : Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}
