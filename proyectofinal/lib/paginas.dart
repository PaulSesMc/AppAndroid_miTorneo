import 'dart:io';
import 'package:flutter/material.dart';
import 'package:proyectofinal/operation.dart';
import 'equipos.dart';
import 'home.dart';

class Paginas extends StatelessWidget {
  @override
  int _selectedIndex = 0;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              foregroundColor: Color.fromARGB(255, 235, 133, 0),
              backgroundColor: Colors.white,
              title: Image.asset('assets/images/logo3.png',
                  height: 80, width: 80)),
          bottomNavigationBar: menu(),
          body: TabBarView(
            children: [home(), Equipos(products: fetchTeam())],
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
            icon: Icon(Icons.sports_basketball),
          ),
          Tab(
            text: "Estadísticas",
            icon: Icon(Icons.bar_chart),
          ),
          Tab(
            text: "Opiniones",
            icon: Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}
