import 'package:flutter/material.dart';
import 'package:flutter_application_drawer/ejercicios/ejercicio09.dart';

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
        backgroundColor:
            const Color.fromARGB(255, 224, 6, 108), // Color de fondo del AppBar
        title: const Text('Ejercicios Flutter'),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(
              255, 240, 149, 225), // Color de fondo del Drawer
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                color: const Color.fromARGB(
                    255, 183, 95, 227), // Color de fondo solo para las letras
                child: ListTile(
                  title: const Text(
                    'Ejercicio 09 - Botones',
                    style: TextStyle(
                      color: Colors.white, // Color del texto
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
            ],
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(
            255, 253, 95, 147), // Color de fondo del contenido principal
        child: const Center(
          child: Text(
            'Bienvenido a los Ejercicios Flutter',
            style: TextStyle(
              fontSize: 24.0, // Tamaño de fuente ajustado
              color: Colors.white, // Color del texto
            ),
          ),
        ),
      ),
    );
  }
}
