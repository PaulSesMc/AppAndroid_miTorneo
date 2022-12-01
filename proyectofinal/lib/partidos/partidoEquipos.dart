import 'package:flutter/material.dart';
import 'partido.dart';
import 'partidoList.dart';
import '../operation.dart';

class PartidosEquipo extends StatelessWidget {
  PartidosEquipo({super.key, required this.id_equipo});
  final int id_equipo;

  @override
  Widget build(BuildContext context) {
    final Future<List<Partido>> products = fetchPartidosEquipo(id_equipo);
    Key k = new Key("");
    return MaterialApp(
        title: "Partidos",
        home: Scaffold(
            appBar: AppBar(
                title: const Text("Partidos"),
                backgroundColor: Color.fromARGB(255, 235, 133, 0),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  //replace with our own icon data.
                )),
            body: Center(
              child: FutureBuilder<List<Partido>>(
                future: products,
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? PartidoList(items: snapshot.data!, key: k)
                      : Center(child: CircularProgressIndicator());
                },
              ),
            )));
  }
}
