import 'dart:convert';
import 'dart:async';
import 'team.dart';
import 'package:http/http.dart' as http;

Future<List<Team>> fetchTeam() async {
  final response =
      await http.get(Uri.parse('https://mitorneo.glitch.me/mostrarfruits'));
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

/*Future<Team> sendTeam(
    String title, int id, String imageurl, int quantity) async {
  final http.Response response = await http.post(
    Uri.parse('https://mitorneo.glitch.me/mostrarfruits'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
      'imageurl': imageurl,
      'quantity': quantity.toString()
    }),
  );
  if (response.statusCode == 201) {
    return Fruit.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

Future<Fruit> deleteFruit(int id) async {
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