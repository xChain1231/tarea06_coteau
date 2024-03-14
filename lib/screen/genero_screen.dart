// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GeneroScreen extends StatefulWidget {
  const GeneroScreen({super.key});

  @override
  _GeneroScreenState createState() => _GeneroScreenState();
}

class _GeneroScreenState extends State<GeneroScreen> {
  String _nombre = '';
  String _genero = '';
  double _probabilidad = 0;

  void _predecirGenero(String nombre) async {
    final response =
        await http.get(Uri.parse('https://api.genderize.io/?name=$nombre'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _nombre = data['name'];
        _genero = data['gender'];
        _probabilidad = double.parse(data['probability'].toString());
      });
    } else {
      // Manejo de errores
      print('Error al obtener datos de la API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Predicción de Género'),
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
              onPressed: () => _predecirGenero(_nombre),
              child: const Text('Predecir Género'),
            ),
            const SizedBox(height: 20),
            Text('Nombre: $_nombre'),
            Text('Género: $_genero'),
            Text('Probabilidad: ${(_probabilidad * 100).toStringAsFixed(2)}%'),
          ],
        ),
      ),
    );
  }
}
