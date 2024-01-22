/*12. En un formulario hay un número que tenemos que averiguar desde el 1 hasta el 100. El formulario se
 validará cuando acertemos el valor. Para ello, hay que poner el teclado numérico y dar mensajes adecuados si 
 el número introducido es menor o mayor al que hay que descubrir.
Utilizad otros elementos que no hayáis utilizado en el ejercicio anterior.*/
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const JuegoEncontrarNumero());
}

class JuegoEncontrarNumero extends StatelessWidget {
  const JuegoEncontrarNumero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adivina el Número',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text('Adivina el Número')),
          body: const Center(child: GuessNumberForm()),
        ),
      ),
    );
  }
}

class GuessNumberForm extends StatefulWidget {
  const GuessNumberForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GuessNumberFormState createState() => _GuessNumberFormState();
}

class _GuessNumberFormState extends State<GuessNumberForm> {
  int targetNumber = 0;
  String guessedNumber = '';
  String feedbackMessage = '';
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    generateTargetNumber();
  }

  void generateTargetNumber() {
    final Random random = Random();
    final int newTargetNumber = 1 + random.nextInt(100);

    setState(() {
      targetNumber = newTargetNumber;
      feedbackMessage = ''; // Reiniciar el mensaje
      _textController.clear(); // Limpiar el campo de texto
    });
  }

  void checkGuess() {
    if (guessedNumber.isEmpty) {
      return; // No hacer nada si no se ha ingresado ningún número
    }

    final int parsedGuess = int.tryParse(guessedNumber) ?? 0;

    if (parsedGuess == targetNumber) {
      showAlertDialog('¡Felicidades!', 'Adivinaste el número.');
    } else if (parsedGuess < targetNumber) {
      showAlertDialog(
          'Número Incorrecto', 'El número es mayor. ¡Inténtalo de nuevo!');
    } else {
      showAlertDialog(
          'Número Incorrecto', 'El número es menor. ¡Inténtalo de nuevo!');
    }

    // Limpiar el campo de adivinanza después de verificar
    setState(() {
      guessedNumber = '';
    });
  }

  void showAlertDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Adivina el número entre 1 y 100:',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _textController, // Utilizar el controlador
            keyboardType: TextInputType.number,
            onChanged: (input) {
              setState(() {
                guessedNumber = input;
              });
            },
            decoration: const InputDecoration(
              hintText: 'Ingresa un número',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              checkGuess();
            },
            child: const Text('Verificar'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              generateTargetNumber(); // Reiniciar el juego al presionar el botón "Nuevo Juego"
            },
            child: const Text('Nuevo Juego'),
          ),
        ],
      ),
    );
  }
}
