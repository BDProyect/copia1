/*
* Autor: Orlando Lucero Camacho
* Descripción: En este fichero podemos crear un nuevo usuario
* Última modificación: 23-06-2022
* */
import 'package:flutter/material.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final List<String> _listaRoles = <String>[
    'Administrador',
    'Operador',
    'Supervisor'
  ];

  String _vistaRoles = 'Seleccione un rol';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF01325E),
          //centerTitle: true,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: Text(
                  'INSTITUTO TECNOLÓGICO DE OAXACA       |       LABORATORIO DE BASE DE DATOS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ),
              ClipRRect(
                //borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/ito_escudo.png',
                  height: 56,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
            const EdgeInsets.only(left: 60, right: 60, top: 30, bottom: 30),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () => _backToHome(context),
                        child: const Text(
                          '< Volver',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Expanded(
                      child: Text(
                        'Panel de control',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: const Color(0xFFBAD1FF),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50, top: 30, bottom: 30),
                      child: Column(
                        children: <Widget>[
                          Row(children: const <Widget>[
                            Text(
                              'Crea un nuevo usuario',
                              style: TextStyle(fontSize: 32),
                            )
                          ]),
                          const SizedBox(
                            height: 70,
                          ),
                          Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    width: 500,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, top: 10, bottom: 10),
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15.0),
                                            color: const Color(0xFF01325E),
                                          ),
                                          child: const Text(
                                            'Nombre',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: 320,
                                              height: 40,
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(10.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(15.0),
                                                color: Colors.white,
                                              ),
                                              child: TextFormField(),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20,),
                                  Container(
                                    width: 500,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, top: 10, bottom: 10),
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15.0),
                                            color: const Color(0xFF01325E),
                                          ),
                                          child: const Text(
                                            'Usuario',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: 320,
                                              height: 40,
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(10.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(15.0),
                                                color: Colors.white,
                                              ),
                                              child: TextFormField(),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20,),
                                  Container(
                                    width: 500,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15.0),
                                            color: const Color(0xFF01325E),
                                          ),
                                          child: const Text(
                                            'Rol',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        DropdownButton(
                                          items: _listaRoles.map((String a) {
                                            return DropdownMenuItem(
                                                value: a, child: Text(a));
                                          }).toList(),
                                          onChanged: (text) => {
                                            setState(() {
                                              _vistaRoles = text.toString();
                                            })
                                          },
                                          hint: Text(_vistaRoles),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 500,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, top: 10, bottom: 10),
                                          width: 130,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15.0),
                                            color: const Color(0xFF01325E),
                                          ),
                                          child: const Text(
                                            'Correo',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: 320,
                                              height: 40,
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(10.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(15.0),
                                                color: Colors.white,
                                              ),
                                              child: TextFormField(),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20,),
                                  Container(
                                    width: 500,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, top: 10, bottom: 10),
                                          width: 130,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15.0),
                                            color: const Color(0xFF01325E),
                                          ),
                                          child: const Text(
                                            'Contraseña',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: 320,
                                              height: 40,
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(10.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(15.0),
                                                color: Colors.white,
                                              ),
                                              child: TextFormField(),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20,),
                                  Container(
                                    width: 500,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                          width: 130,
                                          height: 60,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15.0),
                                            color: const Color(0xFF01325E),
                                          ),
                                          child: const Text(
                                            'Contraseña',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: 320,
                                              height: 60,
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(10.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(15.0),
                                                color: Colors.white,
                                              ),
                                              child: TextFormField(
                                                style: const TextStyle(fontSize: 20),
                                                decoration: const InputDecoration(
                                                    hintText: 'Ej: 123456'
                                                ),
                                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    return 'Por favor ingresa tu contraseña.';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          Row(
                            children: <Widget>[
                              ElevatedButton(
                                  style: _elevatedButtonStyle(context),
                                  onPressed: () {},
                                  child: const Text('Crear usuario')
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ButtonStyle _elevatedButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      primary: Theme.of(context).primaryColor,
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  void _backToHome(BuildContext context) {
    Navigator.of(context).pushNamed('/controlPanelPage');
  }
}
