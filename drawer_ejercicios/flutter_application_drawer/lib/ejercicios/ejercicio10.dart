/*En el ejercicio resuelto en el punto 5.6 (páginas 27-32) realiza:
- una mejora en el aspecto 
- inserta un color nuevo a las posibilidades de los colores que se presentan en pantalla
- modifica el tiempo en el que varíen los colores y, cada vez que consiga cinco puntos se incremente la velocidad y cuando disminuya la puntuación,
  también disminuya la velocidad.
- Cada vez que se produzca un acierto haz alguna animación
- Este programa tiene un error: cuando coincide el color del container y el nombre del color, cada pulsación te lo va a contar como acierto, pudiendo sumar más de un punto 
  cada vez que se pulsa aunque solo haya habido una coincidencia. Busca una solución a este error.*/

import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(const RandomColors());
}

class RandomColors extends StatefulWidget {
  const RandomColors({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RandomColorsState createState() => _RandomColorsState();
}

class _RandomColorsState extends State<RandomColors>
    with SingleTickerProviderStateMixin {
  int points = 0;
  late String randomName;
  late Color randomColor;
  bool hasScored = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  var colorNames = [
    'azul',
    'verde',
    'naranja',
    'rosa',
    'rojo',
    'morado',
    'amarillo'
  ];
  var colorHex = [
    const Color(0xFF0000FF),
    const Color(0xFF00FF00),
    const Color(0xFFFF914D),
    const Color(0xFFFF66C4),
    const Color(0xFFFF0000),
    const Color(0xFF800080),
    const Color(0xFFFBC512)
  ];

  @override
  void initState() {
    super.initState();
    getRandomColor();
    getRandomName();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    timer();
  }

  void timer() {
    Timer.periodic(Duration(milliseconds: calculateTimerDuration()), (timer) {
      getRandomColor();
      getRandomName();
      hasScored = false;

      // Verifica si se han alcanzado múltiplos de cinco puntos y ajusta el tiempo
      if (points > 0 && points % 5 == 0) {
        // Aumenta la velocidad en cada múltiplo de 5 puntos
        int speedMultiplier = (points ~/ 5) + 1;
        _animationController.duration = Duration(seconds: 2 ~/ speedMultiplier);
      } else {
        _animationController.duration = const Duration(seconds: 2);
      }

      setState(() {});
    });
  }

  int calculateTimerDuration() {
    // Calcular la duración del temporizador en base a la puntuación actual
    return max(1500 - (points * 100), 500);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Juego de Colores'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 174, 226, 230),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Autor: Doriana Da Costa',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Color.fromARGB(255, 13, 114, 182),
              ),
            ),
            if (hasScored)
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animation.value,
                    child: Image.asset('assets/aplausos.png',
                        width: 120, height: 120),
                  );
                },
              ),
            Text(
              'Puntos: $points',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  onGiftTap(randomName, randomColor);
                },
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      color: randomColor,
                      height: 120,
                      child: hasScored
                          ? const Text('Has acertado!')
                          : const SizedBox(),
                    ),
                    Text(
                      randomName,
                      style: TextStyle(
                        color: randomColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getRandomColor() {
    Random random = Random();
    int randomNumber = random.nextInt(6);
    randomColor = colorHex[randomNumber];
  }

  void getRandomName() {
    Random random = Random();
    int randomNumber = random.nextInt(6);
    randomName = colorNames[randomNumber];
  }

  String hexToStringConverter(Color hexColor) {
    if (hexColor == const Color(0xFF0000FF)) {
      return 'azul';
    } else if (hexColor == const Color(0xFF00FF00)) {
      return 'verde';
    } else if (hexColor == const Color(0xFFFF914D)) {
      return 'naranja';
    } else if (hexColor == const Color(0xFFFF66C4)) {
      return 'rosa';
    } else if (hexColor == const Color(0xFFFF0000)) {
      return 'rojo';
    } else if (hexColor == const Color(0xFF800080)) {
      return 'morado';
    } else {
      return 'amarillo';
    }
  }

  void onGiftTap(String name, Color color) {
    if (!hasScored) {
      var colorToString = hexToStringConverter(color);

      if (name == colorToString) {
        points++;
        hasScored = true;
        _animationController.reset();
        _animationController.forward();
      } else {
        points--;
      }

      setState(() {});
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
