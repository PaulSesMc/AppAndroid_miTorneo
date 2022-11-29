import 'package:flutter/material.dart';
import 'team.dart';
import 'teamList.dart';
import '../operation.dart';

class Equipos extends StatelessWidget {
  final Future<List<Team>> products = fetchTeam();

  @override
  Widget build(BuildContext context) {
    Key k = new Key("");
    return Scaffold(
        body: Center(
      child: FutureBuilder<List<Team>>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? TeamList(items: snapshot.data!, key: k)
              : Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}
