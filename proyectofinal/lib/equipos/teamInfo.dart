import 'package:flutter/material.dart';
import 'package:proyectofinal/jugadores/jugadores.dart';
import 'registrarEquipo.dart';
import 'team.dart';
import 'package:proyectofinal/jugadores/player.dart';
import 'package:proyectofinal/jugadores/playerItem.dart';
import 'package:proyectofinal/jugadores/playerList.dart';
import 'package:proyectofinal/operation.dart';

class TeamInfo extends StatelessWidget {
  const TeamInfo({super.key, required this.item});
  final Team item;

  @override
  Widget build(BuildContext context) {
    //final Future<List<Player>> players = fetchJugadorEquipo(item.id_equipo);
    String _title = item.nombre.toUpperCase();
    Key k = new Key("");

    return MaterialApp(
        title: _title,
        home: Scaffold(
            appBar: AppBar(
                title: Text(_title),
                backgroundColor: Color.fromARGB(255, 235, 133, 0),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                )),
            body: Column(children: <Widget>[
              Container(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.network(
                              this.item.logo,
                              height: 150,
                              width: 150,
                            ),
                            ListTile(
                              title: Text(_title, textAlign: TextAlign.center),
                              subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                        'Puntos por partido: ${item.puntos_favor / item.juegos_jugados}'),
                                    Text(
                                        'Puntos en contra: ${item.puntos_contra / item.juegos_jugados}')
                                  ]),
                            )
                          ],
                        ),
                      ))),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: Size(250, 50),
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                ),
                icon: Icon(Icons.star, size: 32),
                label: Text(
                  'Jugadores',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Jugadores(item: item)));
                }),
              ),
            ])));
  }
}
