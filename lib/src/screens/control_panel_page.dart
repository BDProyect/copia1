/*
* Autor: Orlando Lucero Camacho
* Descripción: Este fichero contiene el código de la ventana "panel de control"
*              aquí sólo mostramos los usuarios actuales registrados y podemos
*              crear nuevos usuarios
* Última modificación: 23-06-2022
* */
import 'package:flutter/material.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
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
                              'Administra los usuarios',
                              style: TextStyle(fontSize: 32),
                            )
                          ]),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: <Widget>[
                              ElevatedButton(
                                  onPressed: () => _createUser(context),
                                  style: _elevatedButtonStyle(context),
                                  child: const Text('Crear nuevo usuario')
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: <Widget>[
                              Column(
                                children: const <Widget>[
                                  Icon(Icons.person, size: 90,)
                                ],
                              ),
                              const SizedBox(width: 30,),
                              Column(
                                children: const <Widget>[
                                  Text('Nombre:', style: TextStyle(fontSize: 20)),
                                  Text('Rol:', style: TextStyle(fontSize: 20),),
                                  Text('Usuario:', style: TextStyle(fontSize: 20),),
                                  Text('Correo:', style: TextStyle(fontSize: 20),)
                                ],
                              ),
                              const SizedBox(width: 30,),
                              Column(
                                children: const <Widget>[
                                  Text('John Doe', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                  Text('Administrador', style: TextStyle(fontSize: 20),),
                                  Text('21160001', style: TextStyle(fontSize: 20),),
                                  Text('john.doe@itoaxaca.edu.mx', style: TextStyle(fontSize: 20),)
                                ],
                              ),
                              const SizedBox(width: 30,),
                              Column(
                                children: <Widget>[
                                  TextButton(
                                      onPressed: () {},
                                      child: const Icon(Icons.delete, size: 30, color: Colors.black,)
                                  ),
                                  const SizedBox(height: 10,),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Icon(Icons.edit, size: 30, color: Colors.black,)
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 100,
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
    Navigator.of(context).pushNamed('/homePage');
  }

  void _createUser(BuildContext context) {
    Navigator.of(context).pushNamed('/createUserPage');
  }
}
