/* 8º Al ejercicio que hemos creado en clase donde hemos realizado nosotros el contador de clics 
(el mismo ejemplo que crea cuando creamos un proyecto nuevo de flutter), añadir el botón de decrementar 
el contador y añadir otro que haga una puesta a cero del contador.*/

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Contador de clics",
      home: MiClase(
        title: 'Contador de clics',
      ),
    );
  }
}

class MiClase extends StatefulWidget {
  const MiClase({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MiClase> createState() => _MiClase();
}

class _MiClase extends State<MiClase> {
  int _contador = 0;

  void _incrementar() {
    setState(() {
      _contador++;
    });
  }

  void _decrementar() {
    setState(() {
      if (_contador > 0) {
        _contador--;
      }
    });
  }

  void _reiniciar() {
    setState(() {
      _contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(
              255, 242, 164, 190), // Cambia el color de fondo a rosa
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Has pulsado...',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              Text(
                '$_contador',
                style: const TextStyle(
                  fontSize: 35,
                  color: Color.fromARGB(255, 111, 76, 175),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _decrementar,
            tooltip: 'Decrementar',
            backgroundColor: const Color.fromARGB(255, 89, 244, 54),
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: _incrementar,
            tooltip: 'Incrementar',
            backgroundColor: const Color.fromARGB(255, 33, 243, 222),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: _reiniciar,
            tooltip: 'Reiniciar',
            backgroundColor: const Color.fromARGB(255, 255, 0, 200),
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
