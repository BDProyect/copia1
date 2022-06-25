/*
* Autor: Orlando Lucero Camacho
* Descripción: Este fichero contiene el código de la ventana "Agregar práctica"
* Última modificación: 23-06-2022
* */
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ito_laboratorio_bdatos/src/screens/home_page.dart';
//import 'package:ito_laboratorio_bdatos/src/models/practica.dart';
//import 'package:sqflite_common_ffi/sqflite_ffi.dart';
//import 'dart:async';
import 'package:mysql1/mysql1.dart';

//import '../models/db.dart';

class NewPractice extends StatefulWidget {
  const NewPractice({Key? key}) : super(key: key);

  @override
  State<NewPractice> createState() => _NewPracticeState();
}

class _NewPracticeState extends State<NewPractice> {
  // Contenido de los DropdownButton -equivalente a combobox-
  final List<String> _listaCarrera = <String>[
    'Ingeniería en Sistemas Computacionales',
    'Ingeniería Eléctrica',
    'Ingeniería en Gestión Empresarial',
    'Ingeniería Electrónica',
    'Ingeniería Industrial'
  ];
  final List<String> _listaMateria = <String>[
    'Ingeniería de software',
    'Lenguajes de interfaz',
    'Programación',
    'Estructura de datos',
    'Mercadotecnia electrónica'
  ];
  final List<String> _listaGrupos = <String>[
    '6SB-SCC-1014',
    'IEU-ELC-1022',
    '3SB-SCD-1007',
    '2GA-AEB-1082',
    '7GA-AEB-1045',
    'SCD-1008-6SA'
  ];
  final List<String> _listaDocentes = <String>[
    'Benitez Quecha Claribel',
    'Castañon Olguin Eduardo',
    'García Martínez Raúl',
    'Jiménez Halla Johann Francisco',
    'Monzoy Ventre Elsie Fernanda'
  ];
  final List<String> _listaAlumnos = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
  ];
  final List<String> _listaSoftware = <String>[
    'Oracle',
    'MySQL Workbench',
    'PostgreSQL',
    'XAMPP',
    'phpMyAdmin',
    'MariaDB',
    'Ubuntu Server',
    'Otro'
  ];
  final List<String> _listaDesde = <String>[
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00'
  ];
  final List<String> _listaHasta = <String>[
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00'
  ];

  // Mensaje por defecto al seleccionar un valor de los DropdownButtons
  String _vistaFecha = 'Seleccione una fecha';
  String _vistaCarrera = 'Seleccione una opción';
  String _vistaMateria = 'Seleccione una opción';
  String _vistaGrupo = 'Seleccione una opción';
  String _vistaDocente = 'Seleccione una opción';
  String _vistaAlumnos = 'Seleccione una opción';
  String _vistaSoftware = 'Seleccione una opción';
  String _vistaDesde = 'Seleccione';
  String _vistaHasta = 'Seleccione';
  // Variables para registrar la fecha en la que se desea guardar una práctica
  DateTime _selectedDate = DateTime.now();
  String _dayName = '';
  // Variable para recuperar las practicas creadas de la BD
  //late Practica? practica;

  @override
  Widget build(BuildContext context) {
    //practica = ModalRoute.of(context)?.settings.arguments as Practica?;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF01325E),
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
          //centerTitle: true,
        ),
        body: SingleChildScrollView(
          // Volvemos scrolleable nuestra ventana principal
          child: Container(
            padding:
                const EdgeInsets.only(left: 60, right: 60, top: 30, bottom: 30),
            child: Column(
              children: <Widget>[
                Row(
                  // Agregamos el botón para volver a la ventana principal
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () => _backToHome(context),
                        child: const Text(
                          '< Volver',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                  ],
                ),
                Row(
                  // Título de esta ventana
                  children: const <Widget>[
                    Expanded(
                      child: Text(
                        'Agregar práctica',
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
                  // Hacemos scrolleable horizontalmente el menú para agregar datos
                  scrollDirection: Axis.horizontal,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: const Color(0xFFBAD1FF),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 30, bottom: 30),
                      child: Column(
                        children: <Widget>[
                          Row(children: const <Widget>[
                            Text(
                              'Agrega los datos solicitados a continuación',
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
                                  SizedBox(
                                    width: 500,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: const Color(0xFF01325E),
                                          ),
                                          child: const Text(
                                            'Fecha',
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
                                        DropdownButton<DateTime>(
                                            hint: Text(_vistaFecha),
                                            items: [_vistaFecha]
                                                .map((e) =>
                                                    DropdownMenuItem<DateTime>(
                                                        child: Text(e)))
                                                .toList(),
                                            onChanged: (DateTime? value) {
                                              setState(() {
                                                showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime(2022),
                                                        lastDate:
                                                            DateTime(2027))
                                                    .then((date) {
                                                  setState(() {
                                                    _selectedDate = date!;
                                                    _vistaFecha =
                                                        '${_selectedDate.year}/${_selectedDate.month}/${_selectedDate.day}';
                                                    _dayName =
                                                        '${DateFormat('EEEE').format(date)}';
                                                    changeDayName(_dayName);
                                                  });
                                                });
                                              });
                                            }),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text('${_dayName}')
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 500,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: const Color(0xFF01325E),
                                          ),
                                          child: const Text(
                                            'Carrera',
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
                                          items: _listaCarrera.map((String a) {
                                            return DropdownMenuItem(
                                                value: a, child: Text(a));
                                          }).toList(),
                                          onChanged: (text) => {
                                            setState(() {
                                              _vistaCarrera = text.toString();
                                            })
                                          },
                                          hint: Text(_vistaCarrera),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 500,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: const Color(0xFF01325E),
                                          ),
                                          child: const Text(
                                            'Materia',
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
                                          items: _listaMateria.map((String a) {
                                            return DropdownMenuItem(
                                                value: a, child: Text(a));
                                          }).toList(),
                                          onChanged: (text) => {
                                            setState(() {
                                              _vistaMateria = text.toString();
                                            })
                                          },
                                          hint: Text(_vistaMateria),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 500,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: const Color(0xFF01325E),
                                          ),
                                          child: const Text(
                                            'Grupo',
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
                                          items: _listaGrupos.map((String a) {
                                            return DropdownMenuItem(
                                                value: a, child: Text(a));
                                          }).toList(),
                                          onChanged: (text) => {
                                            setState(() {
                                              _vistaGrupo = text.toString();
                                            })
                                          },
                                          hint: Text(_vistaGrupo),
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
                                  SizedBox(
                                    width: 420,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: const Color(0xFF01325E),
                                          ),
                                          child: const Text(
                                            'Docente',
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
                                          items: _listaDocentes.map((String a) {
                                            return DropdownMenuItem(
                                                value: a, child: Text(a));
                                          }).toList(),
                                          onChanged: (text) => {
                                            setState(() {
                                              _vistaDocente = text.toString();
                                            })
                                          },
                                          hint: Text(_vistaDocente),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 460,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: const Color(0xFF01325E),
                                          ),
                                          child: const Text(
                                            'Alumnos',
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
                                          items: _listaAlumnos.map((String a) {
                                            return DropdownMenuItem(
                                                value: a, child: Text(a));
                                          }).toList(),
                                          onChanged: (text) => {
                                            setState(() {
                                              _vistaAlumnos = text.toString();
                                            })
                                          },
                                          hint: Text(_vistaAlumnos),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 460,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: const Color(0xFF01325E),
                                          ),
                                          child: const Text(
                                            'Software',
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
                                          items: _listaSoftware.map((String a) {
                                            return DropdownMenuItem(
                                                value: a, child: Text(a));
                                          }).toList(),
                                          onChanged: (text) => {
                                            setState(() {
                                              _vistaSoftware = text.toString();
                                            })
                                          },
                                          hint: Text(_vistaSoftware),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 460,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: const Color(0xFF01325E),
                                          ),
                                          child: const Text(
                                            'Horario',
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
                                        const Text(
                                          'Desde',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        DropdownButton(
                                          items: _listaDesde.map((String a) {
                                            return DropdownMenuItem(
                                                value: a, child: Text(a));
                                          }).toList(),
                                          onChanged: (text) => {
                                            setState(() {
                                              _vistaDesde = text.toString();
                                            })
                                          },
                                          hint: Text(_vistaDesde),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        const Text(
                                          'Hasta',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        DropdownButton(
                                          items: _listaHasta.map((String a) {
                                            return DropdownMenuItem(
                                                value: a, child: Text(a));
                                          }).toList(),
                                          onChanged: (text) => {
                                            setState(() {
                                              _vistaHasta = text.toString();
                                            })
                                          },
                                          hint: Text(_vistaHasta),
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
                          ElevatedButton(
                              style: _elevatedButtonStyle(context),
                              onPressed: () => _verifyData(context),
                              child: const Text('AGREGAR PRÁCTICA')),
                          const SizedBox(
                            height: 40,
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

  void _backToHome2(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                _vistaFecha,
                _dayName,
                _vistaCarrera,
                _vistaMateria,
                _vistaGrupo,
                _vistaDocente,
                _vistaAlumnos,
                _vistaSoftware,
                '$_vistaDesde -' + ' $_vistaHasta',
                true)));
  }

  void changeDayName(String dayName) {
    switch (dayName) {
      case 'Sunday':
        _dayName = 'Domingo';
        break;
      case 'Monday':
        _dayName = 'Lunes';
        break;
      case 'Tuesday':
        _dayName = 'Martes';
        break;
      case 'Wednesday':
        _dayName = 'Miércoles';
        break;
      case 'Thursday':
        _dayName = 'Jueves';
        break;
      case 'Friday':
        _dayName = 'Viernes';
        break;
      case 'Saturday':
        _dayName = 'Sábado';
        break;
      case '':
        break;
      default:
        break;
    }
  }

  void _verifyData(BuildContext context) {
    String fecha = 'Seleccione una fecha';
    String txt = 'Seleccione una opción';
    String opt = 'Seleccione';
    if (_vistaFecha != fecha &&
        _vistaCarrera != txt &&
        _vistaMateria != txt &&
        _vistaGrupo != txt &&
        _vistaDocente != txt &&
        _vistaAlumnos != txt &&
        _vistaSoftware != txt &&
        _vistaDesde != opt &&
        _vistaHasta != opt) {
      print(Text('Todo ok'));
      insertData();
      _backToHome2(context);
      //practica
      /*DB.insert(Practica(
          id: 0,
          fecha: _vistaFecha,
          dia: _dayName,
          carrera: _vistaCarrera,
          materia: _vistaMateria,
          grupo: _vistaGrupo,
          docente: _vistaDocente,
          alumnos: int.parse(_vistaAlumnos),
          software: _vistaSoftware,
          desde: _vistaDesde,
          hasta: _vistaHasta));*/
    }
  }

  void insertData() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'root',
        db: 'laboratoriobd',
        password: 'admin'));

    //await conn.query('CREATE TABLE [IF NOT EXISTS] practicas (id int NOT NULL AUTO_INCREMENT PRIMARY KEY, fecha VARCHAR(10), dia VARCHAR(8), carrera VARCHAR(50), materia VARCHAR(40), grupo VARCHAR(15), docente VARCHAR(60), alumnos INT, software VARCHAR(20), horario VARCHAR(13))');

    await Future.delayed(Duration(milliseconds: 1000));

    // Insert some data
    var result = await conn.query(
        'insert into practicas (fecha, dia, carrera, materia, grupo, docente, alumnos, software, horario) values (?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [
          '${_vistaFecha}',
          '${_dayName}',
          '${_vistaCarrera}',
          '${_vistaMateria}',
          '${_vistaGrupo}',
          '${_vistaDocente}',
          int.parse(_vistaAlumnos),
          '${_vistaSoftware}',
          '${_vistaDesde} - ${_vistaHasta}'
        ]);
    print('Inserted row id=${result.insertId}');
  }
}
