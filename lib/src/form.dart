import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormBasico extends StatefulWidget {
  @override
  createState() => _FormBasico();
}

class _FormBasico extends State<FormBasico> {
  String nombreUsuario = "Prueba";
  @override
  build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Formulario")),
        body: Form(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Ingrese su nombre",
                          icon: const Icon(Icons.person_outline),
                          suffixIcon: const Icon(Icons.send),
                          border: const OutlineInputBorder(),
                          helperText: 'Mostrar los mensajes de advertencia',
                          counterText: '${nombreUsuario.length} caracteres'),
                      onChanged: (input) =>
                          setState(() => nombreUsuario = input),
                    ),
                    const Divider(),
                    Text(nombreUsuario),
                  ])),
        ));
  }
}
