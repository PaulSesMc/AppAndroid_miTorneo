import 'package:flutter/material.dart';
import 'package:proyectofinal/equipos/equipos.dart';
import 'package:proyectofinal/operation.dart';
import 'package:proyectofinal/paginas.dart';

class RegistrarEquipo extends StatelessWidget {
  const RegistrarEquipo({super.key});

  static const String _title = 'Registrar Equipo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
            title: const Text(_title),
            backgroundColor: Color.fromARGB(255, 235, 133, 0),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              //replace with our own icon data.
            )),
        body: const NuevoEquipo(),
      ),
    );
  }
}

class NuevoEquipo extends StatefulWidget {
  const NuevoEquipo({super.key});

  @override
  State<NuevoEquipo> createState() => _NuevoEquipoState();
}

class _NuevoEquipoState extends State<NuevoEquipo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String nombre = '';
  String logo = '';

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Nombre del equipo',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'LLenar campo';
                    } else {
                      nombre = value;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Link del logo',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'LLenar campo';
                    } else {
                      logo = value;
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        sendTeam(nombre, logo);
                        print(nombre);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Paginas()),
                          (Route<dynamic> route) => false,
                        );
                      } else {}
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ]),
        ),
      )
    ]));
  }
}
