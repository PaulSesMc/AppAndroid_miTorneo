import 'package:flutter/material.dart';
import 'package:proyectofinal/home.dart';
import 'package:proyectofinal/sesion/login.dart';
import 'paginas.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'MiTorneo';

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false, title: title, home: MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Paginas();
          } else {
            return MyLogin();
          }
        },
      ));
}
