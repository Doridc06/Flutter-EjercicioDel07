import 'package:flutter/material.dart';
import 'package:flutter_application_drawer/ejercicios/ejercicio09.dart';
import 'package:flutter_application_drawer/ejercicios/ejercicio10.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false, // Desactivar el banner de depuración
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 224, 6, 108),
        title: const Text('Ejercicios Flutter'),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 240, 149, 225),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                color: const Color.fromARGB(255, 183, 95, 227),
                child: ListTile(
                  title: const Text(
                    'Ejercicio 09 - Botones',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Exercise09(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 183, 95, 227),
                child: ListTile(
                  title: const Text(
                    'Ejercicio 10 - Juego de colores',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RandomColors(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 253, 95, 147),
        child: const Center(
          child: Text(
            'Bienvenido a los Ejercicios Flutter',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
