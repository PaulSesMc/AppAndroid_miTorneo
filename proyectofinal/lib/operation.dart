import 'dart:convert';
import 'dart:async';
import 'package:proyectofinal/equipos/equipos.dart';
import 'package:proyectofinal/partidos/partido.dart';
import 'jugadores/player.dart';
import 'equipos/team.dart';
import 'package:http/http.dart' as http;

//--------------------------------------------------------------------------------Equipo----------------------------------------------------------------//
Future<List<Team>> fetchTeam() async {
  final response =
      await http.get(Uri.parse('https://mitorneo.glitch.me/mostrarequipos'));
  if (response.statusCode == 200) {
    return decodeTeam(response.body);
  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}

List<Team> decodeTeam(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  print(parsed);
  return parsed.map<Team>((json) => Team.fromMap(json)).toList();
}

Future<Team> sendTeam(String nombre, String logo) async {
  final http.Response response = await http.post(
    Uri.parse('https://mitorneo.glitch.me/insertarequipo'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'nombre': nombre,
      'logo': logo,
    }),
  );
  if (response.statusCode == 201) {
    return Team.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

//--------------------------------------------------------------------------------Partido----------------------------------------------------------------//
Future<List<Partido>> fetchPartidos() async {
  final response =
      await http.get(Uri.parse('https://mitorneo.glitch.me/mostrarpartidos'));
  if (response.statusCode == 200) {
    return decodePartido(response.body);
  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}

List<Partido> decodePartido(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  print(parsed);
  return parsed.map<Partido>((json) => Partido.fromMap(json)).toList();
}

//--------------------------------------------------------------------------------Jugadores----------------------------------------------------------------//
Future<List<Player>> fetchJugadorEquipo(int id_equipo) async {
  final response = await http
      .get(Uri.parse('https://mitorneo.glitch.me/jugadores/:${id_equipo}'));
  if (response.statusCode == 200) {
    return decodePlayer(response.body);
  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}

List<Player> decodePlayer(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  print(parsed);
  return parsed.map<Player>((json) => Player.fromMap(json)).toList();
}



/*Future<Fruit> deleteFruit(int id) async {
  final http.Response response = await http.delete(
    Uri.parse('url/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return Fruit.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to delete fruit.');
  }
}*/