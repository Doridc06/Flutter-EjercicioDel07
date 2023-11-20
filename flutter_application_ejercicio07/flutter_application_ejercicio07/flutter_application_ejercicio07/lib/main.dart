/*
7º Realizar un drawer personalizado, poniendo una imagen que te interese, un nombre adecuado y personalizando los elementos de menú con nombres distintos a los
 que vienen en el ejemplo y poniendo al menos 5 elementos en el menú.*/

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:
          false, // Agrega esta línea para quitar el banner de debug
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer personalizado'),
        backgroundColor: const Color.fromARGB(
          255,
          207,
          47,
          109,
        ), // Cambia el color de fondo del AppBar
      ),
      body: Container(
        // Añade un Container como fondo con el color deseado
        color: const Color.fromARGB(
            255, 162, 112, 196), // Cambia el color de fondo de la pantalla
        child: const Center(
          child: Text(
            'Videojuego League of Legends',
            style: TextStyle(fontSize: 24.0), // Cambia el tamaño de la fuente
          ),
        ),
      ),
      drawer: const MenuLateral(),
    );
  }
}

class MenuLateral extends StatelessWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: 200.0, // Ajusta la altura
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/jinx.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 200.0, // Ajusta la altura
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  ),
                ),
              ),
              const Positioned(
                bottom: 16.0,
                left: 16.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "League of Legends",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "doridacosta96@gmail.com",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Ink(
            color: const Color.fromARGB(255, 207, 47, 109),
            child: const ListTile(
              title: Text(
                "¿Cómo jugar?",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          ListTile(
            title: const Text(
              "Historia",
            ),
            onTap: () {
              // Acción a realizar al hacer clic en la clase Cabecera (se añade la funcionalidad aquí)
            },
          ),
          const ListTile(
            title: Text(
              "Contenido",
            ),
          ),
          const ListTile(
            title: Text(
              "Personajes",
            ),
          ),
          const ListTile(
            title: Text(
              "Sobre nosotros",
            ),
          ),
        ],
      ),
    );
  }
}
