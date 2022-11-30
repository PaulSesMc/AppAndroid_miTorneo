import 'package:flutter/material.dart';
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
    Future<List<Player>> list = fetchJugadorEquipo(item.id_equipo);
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
            body: Container(
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
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: const Text('BUY TICKETS'),
                                onPressed: () {/* ... */},
                              ),
                              const SizedBox(width: 8),
                              TextButton(
                                child: const Text('LISTEN'),
                                onPressed: () {/* ... */},
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                          
                          SingleChildScrollView(
                            child: 
                              FutureBuilder<List<Player>>(
                            future: list,
                            builder: (context, snapshot) {
                            if (snapshot.hasError) print(snapshot.error);
                              return snapshot.hasData
                                ? playerList(items: snapshot.data!, key: k)
                                  : const Center(child: CircularProgressIndicator());
                                },
                          ),
                            
                          ),
                        ],
                      ),
                    )))));
  }
}
                  /*child:
                      Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            Image.network(
              this.item.logo,
              height: 150,
              width: 150,
            ),
            Column(
              children: <Widget>[
                Text(this.item.nombre,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("id:${this.item.id_equipo}"),
                Text(
                    "Record:${this.item.juegos_ganados} - ${this.item.juegos_perdidos}"),
              ],
            )
          ]))),
        ));
  }
}
*/