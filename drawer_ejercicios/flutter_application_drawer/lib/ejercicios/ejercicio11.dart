/*11. Realiza un formulario que permita introducir un nombre y la edad y validar los datos que sean correctos.
 Sí hay que guardar los datos y realiza un diseño adecuado probando distintos elementos explicados en este apartado. */
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const FormularioNombreEdad());

class FormularioNombreEdad extends StatelessWidget {
  const FormularioNombreEdad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Validar Datos',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text('Formularios')),
          body: const Center(child: MyForm()),
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  String nombre = "";
  String edad = "";

  TextEditingController nombreController = TextEditingController();
  TextEditingController edadController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Recuperar datos al iniciar la aplicación
    recuperarDatos();
  }

  Future<void> guardarDatos() async {
    if (_formKey.currentState?.validate() ?? false) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('detalles', [nombre, edad]);

      // Mostrar un SnackBar con el mensaje de éxito
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Datos guardados correctamente'),
        ),
      );

      // Limpiar los campos de texto y reiniciar los controladores
      nombreController.clear();
      edadController.clear();

      // Actualizar las variables del estado
      setState(() {
        nombre = "";
        edad = "";
      });
    }
  }

  Future<void> recuperarDatos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final detalles = prefs.getStringList("detalles");

      if (detalles != null && detalles.length == 2) {
        setState(() {
          nombre = detalles[0];
          nombreController.text = nombre;
          edad = detalles[1];
          edadController.text = edad;
        });
      } else {
        // Manejar el caso en que los detalles no estén presentes o no sean válidos
        // Por ejemplo, puedes restablecer las variables a un valor predeterminado
        setState(() {
          nombre = "";
          nombreController.text = "";
          edad = "";
          edadController.text = "";
        });
      }
    } catch (e) {
      // Manejar cualquier error que pueda ocurrir al recuperar datos
      ('Error al recuperar datos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: nombreController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Nombre",
                labelStyle: TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                hintText: "Nombre completo",
                prefixIcon: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 217, 171, 231),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Este campo es obligatorio';
                } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                  return 'Ingrese solo letras y espacios';
                }
                return null;
              },
              onChanged: (input) {
                setState(() {
                  nombre = input;
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: edadController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Edad",
                labelStyle: TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                hintText: "Edad",
                prefixIcon: Icon(
                  Icons.calendar_today,
                  color: Color.fromARGB(255, 217, 171, 231),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Este campo es obligatorio';
                } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                  return 'Ingrese solo números';
                }
                return null;
              },
              onChanged: (input) {
                setState(() {
                  edad = input;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                guardarDatos();
              },
              child: const Text('Guardar datos'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                recuperarDatos();
              },
              child: const Text('Recuperar datos'),
            ),
          ],
        ),
      ),
    );
  }
}
