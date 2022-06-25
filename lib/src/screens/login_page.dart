/* *
* Autor: Orlando Lucero Camacho
* Descripción: Este fichero contiene el código de inicio de sesión
* Última modificación: 23-06-2022
* */
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  String _user = '';
  late String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Center(
              child: SingleChildScrollView(
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(
                  top: 50, bottom: 60, right: 120, left: 120),
              color: const Color(0xFFBAD1FF),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 120,
                  vertical: 80,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 35, right: 35, top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: const Color(0xFF01325E),
                                ),
                                child: const Text( // Título principal
                                  'INSTITUTO TECNOLÓGICO DE OAXACA',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 85,
                    ),
                    Row(
                      children: <Widget>[
                      /**
                       * Agregamos una imágen decorativa en nuestro login
                       * Expanded es para poder cambiar el tamaño de la imágen según
                       * se cambie el tamaño de la ventana
                       **/
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ClipRRect( // Redondeamos los bordes de la imágen
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  'assets/images/login_desktop.jpg',
                                  height: 420,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ClipRRect(
                                child: Image.asset( // Agregamos el escudo de la escuela
                                  'assets/images/ito_escudo.png',
                                  height: 200,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Laboratorio de base de datos',
                                style: TextStyle(fontSize: 24),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        // El fondo o background de "usuario" se crea en este container
                                        Container(
                                          width: 220,
                                          height: 60,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15.0),
                                            color: const Color(0xFF01325E),
                                          ),
                                          child: const Text(
                                            'Usuario:',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 50),
                                  Expanded(
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: 250,
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
                                                hintText: 'Ej: 21160001'
                                              ),
                                              /*
                                              * En esta sección validamos que el campo de usuario no esté
                                              * vacío, además de verificar que no se escriban ciertos
                                              * caractéres especiales
                                              * */
                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'Por favor ingresa tu usuario.';
                                                } else if (value.contains('@') || value.contains('{') || value.contains('}')) {
                                                  return 'No puedes usar caractéres especiales.';
                                                }
                                                return null;
                                              },
                                              onSaved: (value) {
                                                _user = value!;
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        // El fondo o background de "contraseña" se crea en este container
                                        Container(
                                          width: 220,
                                          height: 60,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: const Color(0xFF01325E),
                                          ),
                                          child: const Text(
                                            'Contraseña:',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 50),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 250,
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
                                            onSaved: (value) {
                                              _password = value!;
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 50),
                              Row( // Creamos el botón de iniciar sesión
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        ElevatedButton(
                                          style: _elevatedButtonStyle(context),
                                          onPressed: () => _validateData(context),
                                          child: const Text('Iniciar sesión'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }

  /*
  * En este método asignamos una capa de personalización para nuestro
  * botón de iniciar sesión
  */
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

  /*
  * Si se ha validado el usuario y la contraseña, accedemos al panel
  * principal de la app
  */
  void _login(BuildContext context) {
    if (!_loading) {
      setState(() {
        _loading = true;
      });
    }
    Navigator.of(context).pushNamed('/homePage');
  }

  /*
  * Este método se encarga de verifica que en la BD realmente exista
  * un usuario y contraseña válidos para iniciar sesión, de no
  * existir, simplemente mostrará un mensaje en pantalla notificando
  * que no ha encontrado coincidencias
  */
  void _validateData(BuildContext context) {
    /*print('user: '+_user);
    if (_user == '21160001' && _password == '123456') {
      _login(context);
    } else if (_user == '21160001' && _password != '123456') {
      _passIncorrect(context);
    }*/
    _login(context);
  }

  _passIncorrect(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: const Text('Contraseña incorrecta'),
              content: _containerAlert(setState),
            );
          });
        });
  }

  Widget _containerAlert(StateSetter setState) {
    return Container(
      width: 120,
      height: 150,
      margin: const EdgeInsets.all(35),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              onChanged: (text) {
                setState(() {

                });
              },
              decoration: const InputDecoration(labelText: 'Ejemplo: 21160001'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: _elevatedButtonStyle(context),
              onPressed: () {},
              child: const Text("Agregar"),
            )
          ],
        ),
      ),
    );
  }
}
