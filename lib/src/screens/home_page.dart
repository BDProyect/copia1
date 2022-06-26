/*
* Autor: Orlando Lucero Camacho
* Descripción: Este fichero es la ventana principal de nuestro proyecto,
*              aquí mostramos el menú de opciones para los diferentes
*              paneles y principalmente mostramos la tabla con las
*              prácticas ya creadas.
* Última modificación: 23-06-2022
* */
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

//import '../models/db.dart';
//import '../models/practica.dart';

class HomePage extends StatefulWidget {
  static List<String> lista2 = <String>[];
  bool temp;

  static int contador = 0;
  static int r2 = 0;
  static int r3 = 0;
  static int r4 = 0;
  static int r5 = 0;
  static int r6 = 0;
  String fecha,
      dia,
      carrera,
      materia,
      grupo,
      docente,
      alumnos,
      software,
      horario;
  HomePage(this.fecha, this.dia, this.carrera, this.materia, this.grupo,
      this.docente, this.alumnos, this.software, this.horario, this.temp,
      {Key? key})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _listaSemestres = <String>[
    '27-01-2022 al 20-06-2022',
    '27-01-2021 al 20-06-2021',
    '27-01-2020 al 20-06-2020',
  ];
  final List<String> _listaCarreras = <String>[
    'Todas las carreras',
    'Ingeniería en Sistemas Computacionales',
    'Ingeniería Eléctrica',
    'Ingeniería en Gestión Empresarial',
    'Ingeniería Electrónica',
    'Ingeniería Industrial'
  ];
  String _vista = 'Seleccione una opción';
  String _vista2 = 'Seleccione una opción';
  final double? columnSpacing = 50.0;
  late int countRows;
  late List<String> lista = <String>[];

  List<DataRow> listaRow = <DataRow>[];

  @override
  void initState() {
    super.initState();
    imprimirLista();
  }

  @override
  Widget build(BuildContext context) {
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
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 30),
            child: Column(
              children: <Widget>[
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Prácticas programadas',
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
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: const Color(0xFFBAD1FF),
                        ),
                        child: const Text('Semestre:',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      DropdownButton(
                        items: _listaSemestres.map((String a) {
                          return DropdownMenuItem(value: a, child: Text(a));
                        }).toList(),
                        onChanged: (text) => {
                          setState(() {
                            _vista = text.toString();
                          })
                        },
                        hint: Text(_vista),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: const Color(0xFFBAD1FF),
                        ),
                        child: const Text(
                          'Carrera:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      DropdownButton(
                        items: _listaCarreras.map((String b) {
                          return DropdownMenuItem(value: b, child: Text(b));
                        }).toList(),
                        onChanged: (value) => {
                          setState(() {
                            _vista2 = value.toString();
                          })
                        },
                        hint: Text(_vista2),
                      ),
                      //const SizedBox(width: 580,),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          style: _elevatedButtonStyle(context),
                          onPressed: () => _controlPanel(context),
                          child: const Text('Panel de control')),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          style: _elevatedButtonStyle(context),
                          onPressed: () => _addPractice(context),
                          child: const Text('Nueva práctica'))
                    ],
                  ),
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
                    child: DataTable(columnSpacing: 20, columns: [
                      DataColumn(
                        label: Expanded(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xFF01325E),
                              ),
                              child: const Text(
                                'FECHA',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xFF01325E),
                              ),
                              child: const Text(
                                'DÍA',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xFF01325E),
                              ),
                              child: const Text(
                                'HORARIO',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xFF01325E),
                              ),
                              child: const Text(
                                'GRUPO',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xFF01325E),
                              ),
                              child: const Text(
                                'CARRERA',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xFF01325E),
                              ),
                              child: const Text(
                                'MATERIA',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xFF01325E),
                              ),
                              child: const Text(
                                'DOCENTE',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: const Color(0xFF01325E),
                              ),
                              child: const Text(
                                'ALUMNOS',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color(0xFF01325E),
                          ),
                          child: const Text(
                            'SOFTWARE',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ], rows: [
                      _dataRow(),
                      _dataRow2(),
                      _dataRow3(),
                      _dataRow4(),
                      _dataRow5(),
                      _dataRowV(),
                      _dataRowV(),
                      _dataRowV(),
                      _dataRowV(),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void imprimirLista() {
    if (widget.temp) {
      HomePage.lista2.add(widget.fecha);
      HomePage.lista2.add(widget.dia);
      HomePage.lista2.add(widget.horario);
      HomePage.lista2.add(widget.grupo);
      HomePage.lista2.add(widget.carrera);
      HomePage.lista2.add(widget.materia);
      HomePage.lista2.add(widget.docente);
      HomePage.lista2.add(widget.alumnos);
      HomePage.lista2.add(widget.software);
    }
  }

  List<DataRow> inputRow(List<DataRow> dr) {
    while (HomePage.lista2.isNotEmpty) {
      for (var i = 0; i <= 8; i++) {
        dr.add(DataRow(cells: [
          DataCell(Center(child: Text(HomePage.lista2.removeAt(0)))),
        ]));
      }
    }

    return dr;
  }

  DataRow _dataRow() {
    if (HomePage.lista2.isEmpty) {
      return const DataRow(cells: [
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
      ]);
    } else {
      return DataRow(cells: [
        DataCell(Center(child: Text(HomePage.lista2[0]))),
        DataCell(Center(child: Text(HomePage.lista2[1]))),
        DataCell(Center(child: Text(HomePage.lista2[2]))),
        DataCell(Center(child: Text(HomePage.lista2[3]))),
        DataCell(Center(child: Text(HomePage.lista2[4]))),
        DataCell(Center(child: Text(HomePage.lista2[5]))),
        DataCell(Center(child: Text(HomePage.lista2[6]))),
        DataCell(Center(child: Text(HomePage.lista2[7]))),
        DataCell(Center(child: Text(HomePage.lista2[8]))),
      ]);
    }
  }

  DataRow _dataRow2() {
    if (HomePage.lista2.length < 18) {
      return const DataRow(cells: [
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
      ]);
    } else {
      return DataRow(cells: [
        DataCell(Center(child: Text(HomePage.lista2[9]))),
        DataCell(Center(child: Text(HomePage.lista2[10]))),
        DataCell(Center(child: Text(HomePage.lista2[11]))),
        DataCell(Center(child: Text(HomePage.lista2[12]))),
        DataCell(Center(child: Text(HomePage.lista2[13]))),
        DataCell(Center(child: Text(HomePage.lista2[14]))),
        DataCell(Center(child: Text(HomePage.lista2[15]))),
        DataCell(Center(child: Text(HomePage.lista2[16]))),
        DataCell(Center(child: Text(HomePage.lista2[17]))),
      ]);
    }
  }

  DataRow _dataRow3() {
    if (HomePage.lista2.length < 27) {
      return const DataRow(cells: [
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
      ]);
    } else {
      return DataRow(cells: [
        DataCell(Center(child: Text(HomePage.lista2[18]))),
        DataCell(Center(child: Text(HomePage.lista2[19]))),
        DataCell(Center(child: Text(HomePage.lista2[20]))),
        DataCell(Center(child: Text(HomePage.lista2[21]))),
        DataCell(Center(child: Text(HomePage.lista2[22]))),
        DataCell(Center(child: Text(HomePage.lista2[23]))),
        DataCell(Center(child: Text(HomePage.lista2[24]))),
        DataCell(Center(child: Text(HomePage.lista2[25]))),
        DataCell(Center(child: Text(HomePage.lista2[26]))),
      ]);
    }
  }

  DataRow _dataRow4() {
    if (HomePage.lista2.length < 36) {
      return const DataRow(cells: [
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
      ]);
    } else {
      return DataRow(cells: [
        DataCell(Center(child: Text(HomePage.lista2[27]))),
        DataCell(Center(child: Text(HomePage.lista2[28]))),
        DataCell(Center(child: Text(HomePage.lista2[29]))),
        DataCell(Center(child: Text(HomePage.lista2[30]))),
        DataCell(Center(child: Text(HomePage.lista2[31]))),
        DataCell(Center(child: Text(HomePage.lista2[32]))),
        DataCell(Center(child: Text(HomePage.lista2[33]))),
        DataCell(Center(child: Text(HomePage.lista2[34]))),
        DataCell(Center(child: Text(HomePage.lista2[35]))),
      ]);
    }
  }

  DataRow _dataRow5() {
    if (HomePage.lista2.length < 45) {
      return const DataRow(cells: [
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
        DataCell(Center(child: Text(''))),
      ]);
    } else {
      return DataRow(cells: [
        DataCell(Center(child: Text(HomePage.lista2[36]))),
        DataCell(Center(child: Text(HomePage.lista2[37]))),
        DataCell(Center(child: Text(HomePage.lista2[38]))),
        DataCell(Center(child: Text(HomePage.lista2[39]))),
        DataCell(Center(child: Text(HomePage.lista2[40]))),
        DataCell(Center(child: Text(HomePage.lista2[41]))),
        DataCell(Center(child: Text(HomePage.lista2[42]))),
        DataCell(Center(child: Text(HomePage.lista2[43]))),
        DataCell(Center(child: Text(HomePage.lista2[44]))),
      ]);
    }
  }

  DataRow _dataRowV() {
    return const DataRow(cells: [
      DataCell(Center(child: Text(''))),
      DataCell(Center(child: Text(''))),
      DataCell(Center(child: Text(''))),
      DataCell(Center(child: Text(''))),
      DataCell(Center(child: Text(''))),
      DataCell(Center(child: Text(''))),
      DataCell(Center(child: Text(''))),
      DataCell(Center(child: Text(''))),
      DataCell(Center(child: Text(''))),
    ]);
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

  void _addPractice(BuildContext context) {
    Navigator.of(context).pushNamed('/nuevaPracticaPage');
  }

  void _controlPanel(BuildContext context) {
    Navigator.of(context).pushNamed('/controlPanelPage');
  }
}
