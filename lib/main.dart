// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:tarea06_coteau/screen/genero_screen.dart';
import 'package:tarea06_coteau/screen/edad_screen.dart';
import 'package:tarea06_coteau/screen/universidades_screen.dart';
import 'package:tarea06_coteau/screen/clima_screen.dart';
import 'package:tarea06_coteau/screen/noticias_screen.dart';
import 'package:tarea06_coteau/screen/acerca_de_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TAREA 06 (COTEAU)',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Roboto',
      ),
      home: const InicioScreen(),
    );
  }
}

class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  _InicioScreenState createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/boxtool.png'),
          fit: BoxFit.cover,
        ),
      ),
    ),
    const GeneroScreen(),
    const EdadScreen(),
    const UniversidadesScreen(),
    const ClimaScreen(),
    NoticiasScreen(),
    const AcercaDeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getScreenTitle(_selectedIndex)),
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: _screens.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Aplicación Multiusos',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              );
            }
            final screenIndex = index - 1;
            return ListTile(
              title: Text(_getScreenTitle(screenIndex)),
              onTap: () {
                setState(() {
                  _selectedIndex = screenIndex;
                });
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
    );
  }

  String _getScreenTitle(int index) {
    switch (index) {
      case 0:
        return 'Inicio';
      case 1:
        return 'Género';
      case 2:
        return 'Edad';
      case 3:
        return 'Universidades';
      case 4:
        return 'Clima';
      case 5:
        return 'Noticias';
      case 6:
        return 'Acerca De';
      default:
        return '';
    }
  }
}
