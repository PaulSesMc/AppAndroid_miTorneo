import 'package:flutter/material.dart';
import 'package:proyectofinal/operation.dart';
import 'package:proyectofinal/paginas.dart';
import 'package:proyectofinal/equipos/team.dart';
import 'package:proyectofinal/equipos/teamList.dart';

class registrarJugador extends StatelessWidget{
  registrarJugador({super.key, required this.item});

  final Team item;
  
  static const String _title = 'Registrar Jugador';
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  String nombre = '';
  String numero = '';
  String edad = '';
  Widget build(BuildContext context) {
    print(item.id_equipo);
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
        body: //const NuevoJugador(item),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  this.item.logo,
                  height: 150,
                  width: 150,
                ),
                Text(item.nombre,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Nombre del jugador',
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
                              hintText: 'Número de jugador',
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'LLenar campo';
                              } else {
                                numero = value;
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Edad del jugador',
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'LLenar campo';
                              } else {
                                edad = value;
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
                                  //(nombre, logo);
                                  //sendPlayer(nombre, int.parse(numero), int.parse(edad), item.id_equipo);
                                  print(nombre);
                                  /*Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => Paginas()),
                                    (Route<dynamic> route) => false,
                                  );*/
                                } else {}
                              },
                              child: const Text('Submit'),
                            ),
                          ),
                        ]),
                  ),
                )

              ]
            ),
          )
      ),
    );
  }
}


/*class NuevoJugador extends StatefulWidget {
  const NuevoJugador(Team item, {super.key});
  
  @override
  State<NuevoJugador> createState() => _NuevoJugadorState(item);
}

class _NuevoJugadorState extends State<NuevoJugador> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String nombre = '';
  String numero = '';
  String edad = '';
  


  @override
  Widget build(BuildContext context)  {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.network(
                              this.item.logo,
                              height: 150,
                              width: 150,
                            ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Nombre del jugador',
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
                    hintText: 'Numero del jugador',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'LLenar campo';
                    } else {
                      numero = value;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Edad',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'LLenar campo';
                    } else {
                      edad = value;
                    }
                    return null;
                  },
                ),
             /*DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list),*/
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        
                        //print(numero);
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
*/
 Future<List<String>> _getEquipos() async{
  final Future<List<Team>> products = fetchTeam();
  print('entra');
  List list = await products;
   List<String> lista = [];
  for ( var m in list){
    lista.add(m.nombre);
  }

  /*for ( var m in lista){
    print(m);
    
  }*/
  
  return lista;
  
}