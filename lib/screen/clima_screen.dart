// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClimaScreen extends StatefulWidget {
  const ClimaScreen({super.key});

  @override
  _ClimaScreenState createState() => _ClimaScreenState();
}

class _ClimaScreenState extends State<ClimaScreen> {
  late Future<Map<String, dynamic>> _datosClima;
  final String _apiKey =
      '5e1fdf8dec33dd9398b6439208ec2769'; // Tu clave API real
  final String _ciudad = 'Santo Domingo'; // Ciudad por defecto

  @override
  void initState() {
    super.initState();
    _datosClima = _obtenerDatosClima(_ciudad);
  }

  Future<Map<String, dynamic>> _obtenerDatosClima(String ciudad) async {
    final url =
        'http://api.openweathermap.org/data/2.5/weather?q=$ciudad&appid=$_apiKey&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Error al obtener datos del clima: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima'),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _datosClima,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final clima = snapshot.data!;
              final temperatura = clima['main']['temp'];
              final descripcion = clima['weather'][0]['description'];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Temperatura: $temperatura°C',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Descripción: $descripcion',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ClimaScreen(),
  ));
}
