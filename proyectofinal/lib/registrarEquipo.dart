import 'package:flutter/material.dart';

class RegistrarEquipo extends StatelessWidget {
  const RegistrarEquipo({super.key});

  static const String _title = 'Registrar Equipo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
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
                  // Process data.
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
