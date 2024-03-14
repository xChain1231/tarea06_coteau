// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EdadScreen extends StatefulWidget {
  const EdadScreen({super.key});

  @override
  _EdadScreenState createState() => _EdadScreenState();
}

class _EdadScreenState extends State<EdadScreen> {
  String _nombre = '';
  int _edad = 0;
  String _categoriaEdad = '';

  void _determinarEdad(String nombre) async {
    final response =
        await http.get(Uri.parse('https://api.agify.io/?name=$nombre'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _nombre = data['name'];
        _edad = data['age'];
        _categoriaEdad = _determinarCategoriaEdad(_edad);
      });
    } else {
      // Manejo de errores
      print('Error al obtener datos de la API');
    }
  }

  String _determinarCategoriaEdad(int edad) {
    if (edad < 18) {
      return 'Joven';
    } else if (edad < 60) {
      return 'Adulto';
    } else {
      return 'Anciano';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Determinación de Edad'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                labelText: 'Ingresa un nombre',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _nombre = value;
              },
            ),
            ElevatedButton(
              onPressed: () => _determinarEdad(_nombre),
              child: const Text('Determinar Edad'),
            ),
            const SizedBox(height: 20),
            if (_edad > 0) ...[
              Text('Nombre: $_nombre'),
              Text('Edad: $_edad'),
              Text('Categoría: $_categoriaEdad'),
            ]
          ],
        ),
      ),
    );
  }
}
