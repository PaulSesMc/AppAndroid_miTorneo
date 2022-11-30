import 'package:flutter/material.dart';
import 'partido.dart';
import 'partidoList.dart';
import '../operation.dart';

class Partidos extends StatelessWidget {
  final Future<List<Partido>> products = fetchPartidos();

  @override
  Widget build(BuildContext context) {
    Key k = new Key("");
    return Scaffold(
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
    ));
  }
}
