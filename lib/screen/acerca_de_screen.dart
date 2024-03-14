import 'package:flutter/material.dart';

class AcercaDeScreen extends StatelessWidget {
  const AcercaDeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca De'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 200.0,
              backgroundImage: AssetImage('assets/images/foto.jpg'),
            ),
            const Text(
              'Jesús Ramón Ortiz Beriguete',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Matrícula: 2019-8124',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                letterSpacing: 2.5,
              ),
            ),
            SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                color: Colors.teal[100],
              ),
            ),
            const Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text('jesusortizberiguete00@gmail.com'),
              ),
            ),
            const Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.code,
                  color: Colors.teal,
                ),
                title: Text(
                    'GitHub: [https://github.com/xChain1231/tarea06_coteau.git]'),
              ),
            ),
            const Text(
              'Habilidades',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  'Desarrollo de Software, Python, Flutter, Base de Datos, ...'), // Enumera tus habilidades
            ),
          ],
        ),
      ),
    );
  }
}
