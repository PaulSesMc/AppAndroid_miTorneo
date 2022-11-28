import 'package:flutter/material.dart';
import 'dart:async';
import 'team.dart';
import 'teamList.dart';
import 'operation.dart';

void main() => runApp(MyApp(products: fetchTeam()));

class MyApp extends StatelessWidget {
  final Future<List<Team>> products;

  MyApp({required this.products});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(products: products),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Future<List<Team>> products;
  Key k = new Key("");
  MyHomePage({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Rest API Demo"),
          backgroundColor: Colors.cyan,
          centerTitle: true,
        ),
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
