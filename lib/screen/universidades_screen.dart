// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UniversidadesScreen extends StatefulWidget {
  const UniversidadesScreen({super.key});

  @override
  _UniversidadesScreenState createState() => _UniversidadesScreenState();
}

class _UniversidadesScreenState extends State<UniversidadesScreen> {
  String _pais = '';
  List _universidades = [];

  void _buscarUniversidades(String pais) async {
    final response = await http.get(
        Uri.parse('http://universities.hipolabs.com/search?country=$pais'));

    if (response.statusCode == 200) {
      final List universidades = json.decode(response.body);
      setState(() {
        _universidades = universidades;
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
        title: const Text('Universidades por País'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                labelText: 'Ingresa el nombre de un país',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _pais = value;
              },
            ),
            ElevatedButton(
              onPressed: () => _buscarUniversidades(_pais),
              child: const Text('Buscar Universidades'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _universidades.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_universidades[index]['name']),
                    subtitle: Text(_universidades[index]['domains'][0]),
                    onTap: () {
                      // Aquí puedes implementar la acción deseada al seleccionar una universidad
                      // Por ejemplo, mostrar un mensaje con un SnackBar:
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Seleccionaste ${_universidades[index]['name']}'),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
