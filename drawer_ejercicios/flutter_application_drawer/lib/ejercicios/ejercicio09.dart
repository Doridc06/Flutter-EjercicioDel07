/*9º Hacer un muestrario con los botones, punto 5.4  que hemos expuesto en los apuntes u otros del 
enlace https://flutter.dev/docs/development/ui/widgets/material#Buttons. Para ello tenemos que realizar 
un gridview de dos columnas donde se muestren cada uno de ellos. Poner 6 botones por lo menos.*/

import 'package:flutter/material.dart';

class Exercise09 extends StatelessWidget {
  const Exercise09({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> buttonData = [
      {
        'text': 'RaisedButton',
        'color': const Color.fromARGB(255, 33, 150, 243)
      },
      {
        'text': 'ElevatedButton',
        'color': const Color.fromARGB(255, 103, 235, 107)
      },
      {'text': 'FlatButton', 'color': const Color.fromARGB(255, 248, 131, 122)},
      {'text': 'TextButton', 'color': const Color.fromARGB(255, 0, 255, 208)},
      {'text': 'IconButton', 'color': Colors.purple},
      {
        'text': 'OutlineButton',
        'color': const Color.fromARGB(255, 255, 59, 183)
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 09 - Botones'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: buttonData.map((data) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
                print('Presionaste ${data['text']}');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: data['color'], // Color del botón
              ),
              child: Text(data['text']),
            ),
          );
        }).toList(),
      ),
    );
  }
}
