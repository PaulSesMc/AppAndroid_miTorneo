import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectofinal/operation.dart';
import 'equipos/equipos.dart';
import 'home.dart';
import 'partidos/partidos.dart';

final user = FirebaseAuth.instance.currentUser!;

class Paginas extends StatelessWidget {
  @override
  int _selectedIndex = 0;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            centerTitle: true,
            foregroundColor: Color.fromARGB(255, 235, 133, 0),
            backgroundColor: Colors.white,
            title:
                Image.asset('assets/images/logo3.png', height: 75, width: 75),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    showAlertDialog(context);
                  },
                  icon: Icon(
                    Icons.person,
                    size: 30,
                  ))
            ],
          ),
          bottomNavigationBar: menu(),
          body: TabBarView(
            children: [home(), Equipos(), Partidos()],
          ),
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: Color.fromARGB(255, 235, 133, 0),
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.white,
        tabs: [
          Tab(
            text: "Inicio",
            icon: Icon(Icons.home),
          ),
          Tab(
            text: "Equipos",
            icon: Icon(Icons.group),
          ),
          Tab(
            text: "Partidos",
            icon: Icon(Icons.sports_basketball),
          ),
          /*Tab(
            text: "Estadisticas",
            icon: Icon(Icons.bar_chart),
          ),*/
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text("Cerrar sesión"),
    onPressed: () {
      Navigator.of(context).pop();
      FirebaseAuth.instance.signOut();
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("${user.email}"),
    content: Text("Deseas cerrar tu sesión?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
