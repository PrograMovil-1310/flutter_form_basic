import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormBasico extends StatefulWidget {
  @override
  createState() => _FormBasico();
}

class _FormBasico extends State<FormBasico> {
  String nombreUsuario = "";
  String apellidoUsuario = "";
  int edadUsuario = 0;
  bool sexoUsuario = false;

  final List<DropdownMenuEntry<String>> _listPais = [
    DropdownMenuEntry<String>(
      label: "Estados Unidos",
      value: 'EEUU',
    ),
    DropdownMenuEntry<String>(
      label: "Honduras",
      value: 'HN',
    ),
  ];
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
                          counterText: '${nombreUsuario.length} caracteres'),
                      onChanged: (input) =>
                          setState(() => nombreUsuario = input),
                    ),
                    const Divider(),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Ingrese su apellido",
                          icon: const Icon(Icons.person_outline),
                          suffixIcon: const Icon(Icons.send),
                          border: const OutlineInputBorder(),
                          counterText: '${apellidoUsuario.length} caracteres'),
                      onChanged: (input) =>
                          setState(() => apellidoUsuario = input),
                    ),
                    const Divider(),
                    TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Ingrese su edad",
                          icon: Icon(Icons.person_outline),
                          suffixIcon: Icon(Icons.numbers),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (input) => setState(
                              () => edadUsuario = int.parse(input),
                            )),
                    const Divider(),
                    Row(
                      children: [
                        const Text("Sexo: "),
                        Radio(
                            toggleable: true,
                            value: 0,
                            groupValue: edadUsuario,
                            onChanged: (input) =>
                                setState(() => input == 0 ? false : true)),
                        const Text("Mujer"),
                        Radio(
                            toggleable: true,
                            value: 1,
                            groupValue: edadUsuario,
                            onChanged: (input) => setState(
                                () => sexoUsuario = input == 0 ? false : true)),
                        const Text("Hombre")
                      ],
                    ),
                    const Divider(),
                    Row(children: [
                      const Text("Nacionalidad: "),
                      DropdownMenu(dropdownMenuEntries: _listPais),
                    ]),
                    const Divider(),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      FloatingActionButton(
                          child: const Icon(Icons.save),
                          onPressed: () => {
                                print(
                                    "${nombreUsuario} ${apellidoUsuario} ${edadUsuario}")
                              })
                    ]),
                    Divider(),
                    Text("${nombreUsuario} ${apellidoUsuario} ${edadUsuario}")
                  ])),
        ));
  }
}
